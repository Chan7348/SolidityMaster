// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { ICRV } from "./interface/ICRV.sol";

contract CRV is ICRV {
    uint private constant YEAR = 365 days; // 一年的秒数
    uint private constant INITIAL_SUPPLY = 1_303_030_303; // 初始供应量
    uint private constant INITIAL_RATE = 274_815_283 * 10**18 / YEAR; // 初始通胀率的分子
    uint private constant PERIOD = YEAR; // 通胀减少周期
    uint private constant RATE_REDUCTION_COEFFICIENT = 1189207115002721024; // 2 ** (1 / 4) * 1e18 // 计算通胀率递减的系数的分子
    uint private constant RATE_DENOMINATOR = 10**18; // 分母
    uint private constant INFLATION_DELAY = 1 days; // 通胀延迟，代币发行后一天才开始通胀
    string public name;
    string public symbol;
    uint8 public decimals;
    uint public totalSupply;
    address public minter;
    address public admin;
    int128 public mining_epoch; // 当前挖矿周期
    uint public start_epoch_time; //当前周期起始时间
    uint public rate; //当前的通胀率
    uint private start_epoch_supply; //此周期的初始供应量
    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) private _allowances;

    constructor() {
            name = "Curve DAO Token";
            symbol = "CRV";
            decimals = 18;
            uint init_supply = INITIAL_SUPPLY * 10**uint(decimals);
            admin = msg.sender;
            balanceOf[msg.sender] = init_supply;
            start_epoch_time = block.timestamp + INFLATION_DELAY - PERIOD; // 去年今天的后一天开始轮回
            mining_epoch = -1;
            rate = 0;
            start_epoch_supply = init_supply;
            totalSupply = init_supply;
            emit Transfer(address(0), msg.sender, init_supply);
    }
    // erc20
    function allowance(address owner, address spender) external view returns (uint) {
        return _allowances[owner][spender];
    }
    function approve(address spender, uint amount) external returns (bool) {
        require(spender != address(0), "CRV: approve to the zero address");
        require(amount == 0 || _allowances[msg.sender][spender] == 0, "CRV: approve amount non-zero");
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }
    function transfer(address recipient, uint amount) external returns (bool) {
        require(recipient != address(0), "CRV: transfer to the zero address");
        _transfer(msg.sender, recipient, amount);
        return true;
    }
    function transferFrom(address sender, address recipient, uint amount) external returns (bool) {
        require(recipient != address(0), "CRV: transfer to the zero address");
        require(_allowances[sender][msg.sender] >= amount, "CRV: transfer amount exceeds allowance");
        _allowances[sender][msg.sender] -= amount;
        _transfer(sender, recipient, amount);
        return true;
    }
    function mint(address account, uint amount) external returns (bool) {
        require(msg.sender == minter, "CRV: only minter can mint");
        require(account != address(0), "CRV: mint to the zero address");
        if (block.timestamp >= start_epoch_time + PERIOD) {//若当前周期还未更新参数，更新一次
            _update_mining_parameters();
        }
        // 不能使用_transfer(), 因为零地址有可能会遇到余额下溢
        balanceOf[account] += amount;
        totalSupply += amount;
        emit Transfer(address(0), account, amount);
        return true;
    }
    function burn(uint amount) external returns (bool) {
        _transfer(msg.sender, address(0), amount);
        totalSupply -= amount;
        return true;
    }
    function _transfer(address sender, address recipient, uint amount) internal {
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
    }
    // crv
    function set_name(string memory _name, string memory _symbol) external {
        require(msg.sender == admin, "CRV: only admin can set name");
        name = _name;
        symbol = _symbol;
    }
    function set_admin(address _admin) external {
        require(msg.sender == admin, "CRV: only admin can set admin");
        admin = _admin;
        emit SetAdmin(_admin);
    }
    function set_minter(address _minter) external {
        require(msg.sender == admin, "CRV: only admin can set minter");
        require(minter == address(0), "CRV: minter already set");
        minter = _minter;
        emit SetMinter(_minter);
    }
    /// @notice 更新挖矿参数，通胀率和周期供应量
    /// @dev 通胀率递减，周期供应量增加
    /// @dev 通胀率 = 通胀率 * 2 ** (1 / 4)
    /// @dev 每个周期只能够更新一次！！
    /// @dev 任何修改挖矿参数的操作都需要调用这个函数
    function _update_mining_parameters() internal {
        // 参数本地化，通胀速率和周期供应量
        uint _rate = rate;
        uint _start_epoch_supply = start_epoch_supply;
        // 通过等量递增方式设置周期开始时间，周期加一
        start_epoch_time += PERIOD;
        mining_epoch += 1;
        // 第一次更新参数的话，设置初始通胀率
        if (_rate == 0) {
            rate = INITIAL_RATE;
        } else {// 非第一次更新参数的话，通胀率递减
            _start_epoch_supply += _rate * PERIOD;// 设置此周期初始供应量
            start_epoch_supply = _start_epoch_supply; // 更新全局变量
            _rate = _rate * RATE_DENOMINATOR / RATE_REDUCTION_COEFFICIENT; // 通胀率递减，每轮速率变为原来的 1 / 2 ** (1 / 4)
        }
        rate = _rate; // 更新全局变量
        emit UpdateMiningParameters(block.timestamp, _rate, _start_epoch_supply);
    }
    function update_mining_parameters() external {
        require(block.timestamp >= start_epoch_time + PERIOD, "CRV: rate update not ready");
        _update_mining_parameters();
    }
    /// @notice 获取当前周期的开始时间
    /// @dev 如果当前时间大于等于当前周期的开始时间 + 通胀减少时间，也就是说挖矿参数还是之前的周期的，则更新一次挖矿参数
    function start_epoch_time_write() external returns (uint) {
        uint _start_epoch_time = start_epoch_time;
        if (block.timestamp >= _start_epoch_time + PERIOD) {
            _update_mining_parameters();
            return start_epoch_time;
        } else return _start_epoch_time;
    }
    /// @notice 获取下一个周期的开始时间
    /// @dev 如果当前时间大于等于当前周期的开始时间 + 通胀减少时间，也就是说挖矿参数还是上个周期的，则更新挖矿参数
    function future_epoch_time_write() external returns (uint) {
        uint _start_epoch_time = start_epoch_time;
        if (block.timestamp >= _start_epoch_time + PERIOD) {
            _update_mining_parameters();
            return start_epoch_time + PERIOD;
        } else return _start_epoch_time + PERIOD;
    }
    /// @notice 获取当前周期下可用的供应量
    /// @return 当前可用的供应量
    /// @dev 供应量 = 周期初始供应量 + (当前时间 - 起始时间) * 通胀率
    function _available_supply() internal view returns (uint) {
        return start_epoch_supply + (block.timestamp - start_epoch_time) * rate;
    }
    function available_supply() external view returns (uint) {
        return _available_supply();
    }
    /// @notice 获取在某个时间段内可挖取的代币数量
    function mintable_in_timeframe(uint start, uint end) external view returns (uint) {
        // 逻辑检查，设置需要用的变量
        require(start <= end, "CRV: start > end");
        uint to_mint = 0;
        uint current_epoch_time = start_epoch_time; // 设置现在的时间为当前周期的起始时间
        uint current_rate = rate; // 设置当前通胀率
        // 第一种情况，结束时间没有超过当前周期的末尾，
        //     进入for循环
        //         第一次循环：
        //             如果结束时间在本轮周期内
        //                 1. 如果计算结束时间超过本轮周期，则把结束时间设为本周期末
        //                 2. 如果计算开始时间超过本轮周期，退出循环 / 如果计算开始时间在本轮周期之前，把开始时间设为本轮周期开始时间
        //                 3. 计算这次循环的可挖量
        //                 4. 如果开始时间大于等于本轮周期开始时间，退出循环/ 如果开始时间不在本轮周期内，还在之前的周期内，继续循环
        //             时间倒回上一个周期
        //             通胀率变为上一个周期的通胀率
        //             检查，要求当前通胀率大于初始通胀率
        //         第二次循环：
        //             相比之前的变化：current_end 和 current_start 的值向前移动了一个周期
        //         循环直到
        if (end > current_epoch_time + PERIOD) {
            current_epoch_time += PERIOD;
            current_rate = current_rate * RATE_DENOMINATOR / RATE_REDUCTION_COEFFICIENT;
        }
        require(end <= current_epoch_time + PERIOD, "CRV: end > current_epoch_time + PERIOD");// end不能超过下个周期末尾
        for (uint i=0;i<999;i++) {// crv只工作999年，之后就不干啦
            if (end >= current_epoch_time) { // 如果结束时间大于当前周期的开始时间
                uint current_end = end;
                if (current_end > current_epoch_time + PERIOD) { // 如果结束时间超过周期，设置结束时间为周期末尾
                    current_end = current_epoch_time + PERIOD;
                }
                uint current_start = start;
                if (current_start >= current_epoch_time + PERIOD) { // 如果开始时间超过此周期，计算完毕
                    break;
                } else if (current_start < current_epoch_time) { // 如果开始时间小于周期开始时间，设置开始时间为周期开始时间
                    current_start = current_epoch_time;
                }
                to_mint += current_rate * (current_end - current_start);// 计算可挖取的代币数量
                if (start >= current_epoch_time) { // 如果开始时间大于当前周期的开始时间，计算完毕
                    break;
                }
            }
            current_epoch_time -= PERIOD;// 减去一个周去
            current_rate = current_rate * RATE_REDUCTION_COEFFICIENT / RATE_DENOMINATOR; // 回撤通胀率
            require(current_rate <= INITIAL_RATE, "CRV: current > INITIAL_RATE");
        }
        return to_mint;
    }
}