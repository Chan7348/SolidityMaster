// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { ICRV } from "./include/ICRV.sol";

contract CRV is ICRV {
    uint internal constant YEAR = 365 days; // 一年的秒数
    uint internal constant INITIAL_SUPPLY = 1_303_030_303; // 初始供应量
    uint internal constant INITIAL_RATE = 274_815_283 * 10**18 / YEAR; // 初始通胀率的分子
    uint internal constant RATE_REDUCTION_TIME = YEAR; // 通胀减少时间
    uint internal constant RATE_REDUCTION_COEFFICIENT = 1189207115002721024; // 2 ** (1 / 4) * 1e18 // 计算通胀率递减的系数的分子
    uint internal constant RATE_DENOMINATOR = 10**18; // 分母
    uint internal constant INFLATION_DELAY = 1 days; // 通胀延迟，代币发行后一天才开始通胀
    string public override name;
    string public override symbol;
    uint8 public override decimals;
    uint public override totalSupply;
    address public override minter;
    address public override admin;
    int128 public mining_epoch;
    uint public start_epoch_time;
    uint public rate;
    uint internal start_epoch_supply;
    mapping(address => uint) public override balanceOf;
    mapping(address => mapping(address => uint)) internal allowances;

    constructor(string memory _name, string memory _symbol, uint8 _decimals) {
        uint init_supply = INITIAL_SUPPLY * 10**uint(decimals);
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        admin = msg.sender;
        balanceOf[msg.sender] = init_supply;
        start_epoch_time = block.timestamp + INFLATION_DELAY - RATE_REDUCTION_TIME; // 去年今天的后一天开始轮回
        mining_epoch = -1;
        rate = 0;
        start_epoch_supply = init_supply;
        totalSupply = init_supply;
        emit Transfer(address(0), msg.sender, init_supply);
    }
    // erc20
    function allowance(address owner, address spender) external view override returns (uint) {
        return allowances[owner][spender];
    }
    function approve(address spender, uint amount) external override returns (bool) {
        require(spender != address(0), "CRV: approve to the zero address");
        require(amount == 0 || allowances[msg.sender][spender] == 0, "CRV: approve amount non-zero");
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }
    function transfer(address recipient, uint amount) external override returns (bool) {
        require(recipient != address(0), "CRV: transfer to the zero address");
        _transfer(msg.sender, recipient, amount);
        return true;
    }
    function transferFrom(address sender, address recipient, uint amount) external override returns (bool) {
        require(recipient != address(0), "CRV: transfer to the zero address");
        require(allowances[sender][msg.sender] >= amount, "CRV: transfer amount exceeds allowance");
        allowances[sender][msg.sender] -= amount;
        _transfer(sender, recipient, amount);
        return true;
    }
    function mint(address account, uint amount) external returns (bool) {
        require(msg.sender == minter, "CRV: only minter can mint");
        _transfer(address(0), account, amount);
        totalSupply += amount;
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
    function _update_mining_parameters() internal {
        uint _rate = rate;
        uint _start_epoch_supply = start_epoch_supply;
        start_epoch_supply += RATE_REDUCTION_TIME;
        mining_epoch += 1;
        if (_rate == 0) {
            rate = INITIAL_RATE;
        } else {
            _start_epoch_supply += _rate * RATE_REDUCTION_TIME;
            start_epoch_supply = _start_epoch_supply;
            _rate = _rate * RATE_DENOMINATOR / RATE_REDUCTION_COEFFICIENT;
        }
        rate = _rate;
        emit UpdateMiningParameters(block.timestamp, _rate, _start_epoch_supply);
    }
    function update_mining_parameters() external {
        require(block.timestamp >= start_epoch_time + RATE_REDUCTION_TIME, "CRV: rate update not ready");
        _update_mining_parameters();
    }
    function start_epoch_time_write() external returns (uint) {
        uint _start_epoch_time = start_epoch_time;
        if (block.timestamp >= _start_epoch_time + RATE_REDUCTION_TIME) {
            _update_mining_parameters();
            return start_epoch_time;
        } else return _start_epoch_time;
    }
    function future_epoch_time_write() external returns (uint) {
        uint _start_epoch_time = start_epoch_time;
        if (block.timestamp >= _start_epoch_time + RATE_REDUCTION_TIME) {
            _update_mining_parameters();
            return start_epoch_time + RATE_REDUCTION_TIME;
        } else return _start_epoch_time + RATE_REDUCTION_TIME;
    }
    function _available_supply() internal view returns (uint) {
        return start_epoch_supply + (block.timestamp - start_epoch_time) * rate;
    }
    function available_supply() external view returns (uint) {
        return _available_supply();
    }
    function mintable_in_timeframe(uint start, uint end) external view returns (uint) {
        require(start <= end, "CRV: start > end");
        uint to_mint = 0;
        uint current_epoch_time = start_epoch_time;
        uint current_rate = rate;
        if (end > current_epoch_time + RATE_REDUCTION_TIME) {
            current_epoch_time += RATE_REDUCTION_TIME;
            current_rate = current_rate * RATE_DENOMINATOR / RATE_REDUCTION_COEFFICIENT;
        }
        require(end <= current_epoch_time + RATE_REDUCTION_TIME, "CRV: end > current_epoch_time + RATE_REDUCTION_TIME");
        for (uint i=0;i<999;i++) {
            if (end >= current_epoch_time) {
                uint current_end = end;
                if (current_end > current_epoch_time + RATE_REDUCTION_TIME) {
                    current_end = current_epoch_time + RATE_REDUCTION_TIME;
                }
                uint current_start = start;
                if (current_start >= current_epoch_time + RATE_REDUCTION_TIME) {
                    break;
                } else if (current_start < current_epoch_time) {
                    current_start = current_epoch_time;
                }
                to_mint += current_rate * (current_end - current_start);
                if (start >= current_epoch_time) {
                    break;
                }
            }
            current_epoch_time -= RATE_REDUCTION_TIME;
            current_rate = current_rate * RATE_REDUCTION_COEFFICIENT / RATE_DENOMINATOR;
            require(current_rate <= INITIAL_RATE, "CRV: current > INITIAL_RATE");
        }
        return to_mint;
    }
}