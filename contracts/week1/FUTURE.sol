// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Week1: 
//     实现一个ERC20代币合约并完成部署和verify到sepolia网络，除了满足最基本的ERC20标准之外，再增加几个要求：
//         1. 支持增发，但每次增发比例不能超过1%，且增发间隔至少需要1年以上；
//         2. 只有合约的owner才可以增发；
//         3. 支持销毁，用户可以销毁自己的代币，获得授权的也可以销毁被授权者的代币；
//         4. 部署要remix和hardhat两种方式都熟悉；
//         5. verify要用remix和hardhat，以及直接在区块链浏览器上都能verify

library SafeMath {
    function mul(uint a, uint b) internal pure returns (uint) {
        if (a==0) {
            return 0;
        }
        uint c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint a, uint b) internal pure returns (uint) {
        uint c = a / b;
        return c;
    }

    function sub(uint a, uint b) internal pure returns (uint) {
        assert(b <= a);
        return a - b;
    }

    function add(uint a, uint b) internal pure returns (uint) {
        uint c = a + b;
        assert (c >= a);
        return c;
    }
}

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

    function _contextSuffixLength() internal view virtual returns (uint) {
        return 0;
    }
}

contract Ownable is Context {
    address public owner;

    constructor() {
        owner = _msgSender();
    }

    modifier onlyOwner() {
        require(_msgSender() == owner);
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        if (newOwner != address(0)) {
            owner = newOwner;
        }
    }
}

interface IERC20 { // Callers MUST handle false from returns (bool success). Callers MUST NOT assume that false is never returned!

    // the total token supply
    function totalSupply() external view returns (uint);

    // balance of address => _owner
    function balanceOf(address _owner) external view returns (uint balance);

    // token transfer
    function transfer(address _to, uint _value) external returns (bool success);

    // token transfer from one to another
    function transferFrom(address _from, address _to, uint _value) external returns (bool success);

    // approve 
    function approve(address _spender, uint _value) external returns (bool success);

    event Transfer(address indexed _form, address indexed _to, uint _value);

    event Approval(address indexed _owner, address indexed _spender, uint _value); 

}

interface IERC20Metadata {
    // name of the token
    function name() external view returns (string memory);

    // symbol of the token
    function symbol() external view returns (string memory);

    // the number of decimals the token uses
    function decimals() external view returns (uint);
}

interface IERC20Errors {

    error ERC20InvalidValue(address sender, uint value);

    error ERC20InsufficientBalance(address sender, uint balance, uint needed);

    error ERC20InvalidSender(address sender);

    error ERC20InvalidReceiver(address receiver);

    error ERC20InsufficientAllowance(address spender, uint allowance, uint needed);

    error ERC20InvalidApprover(address approver);

    error ERC20InvalidSpender(address spender);

    error ERC20InvalidBurner(address burner);
}


contract FUTURE is IERC20, IERC20Metadata, Context, IERC20Errors, Ownable {
//     实现一个ERC20代币合约并完成部署和verify到sepolia网络，除了满足最基本的ERC20标准之外，再增加几个要求：
//         1. 支持增发，但每次增发比例不能超过1%，且增发间隔至少需要1年以上；
//         2. 只有合约的owner才可以增发；
//         3. 支持销毁，用户可以销毁自己的代币，获得授权的也可以销毁被授权者的代币；
//         4. 部署要remix和hardhat两种方式都熟悉；
//         5. verify要用remix和hardhat，以及直接在区块链浏览器上都能verify

    using SafeMath for uint;
    event Mint(address minter, uint number);
    event Burn(address owner, address burner, uint value);
    event ApprovalForBurn(address owner, address burner, uint value);
    mapping(address account => uint) private _balances;

    mapping(address account => mapping(address spender => uint)) public _allowances;
    mapping(address account => mapping(address burner => uint)) public _allowancesForBurn;
    uint private _totalSupply;
    uint private _decimals;

    string private _name;
    string private _symbol;

    // 上次增发的时间戳
    uint public lastMintTime;

    // 最小增发间隔：1年
    uint public constant MINT_INTERVAL = 365 days;

    constructor() {
        _name = "future token";
        _symbol = "FUTURE";
        _totalSupply = 2100_0000_0000_0000;
        _balances[_msgSender()] = _totalSupply;
        _decimals = 8;
        lastMintTime = block.timestamp; // 初始化为部署合约的时间
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint) {
        return _decimals;
    }

    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }
    
    function balanceOf(address account) public view returns (uint) {
        return _balances[account];
    }

    function allowance(address owner, address spender) public view returns (uint) {
        return _allowances[owner][spender];
    } 



    function transfer(address to, uint value) public returns (bool) {
        _transfer(to, value);
        return true;
    }

    function _transfer(address to, uint value) internal {
        // 如果余额不充足
        if (_balances[_msgSender()] < value) {
            revert ERC20InsufficientBalance(_msgSender(), _balances[_msgSender()], value);
        }

        _balances[_msgSender()] = _balances[_msgSender()].sub(value);
        _balances[to] = _balances[to].add(value);

        emit Transfer(_msgSender(), to, value);
    }


    
    function approve(address spender, uint value) public returns (bool) {
        _approve(spender, value);
        return true;
    }

    function _approve(address spender, uint value) internal {
        // 如果授权不为0，此次也不为0，先清零
        if (_allowances[_msgSender()][spender] >0 && value > 0) {
            _allowances[_msgSender()][spender] = 0;
        }

        // 赋予权限
        _allowances[_msgSender()][spender] = value;

        // 广播
        emit Approval(_msgSender(), spender, value);
    }



    function transferFrom(address from, address to, uint value) public returns (bool) {
        _transferFrom(from, to, value);
        return true;
    }

    function _transferFrom(address from, address to, uint value) internal {
        // 检查 value
        if (value <= 0) {
            revert ERC20InvalidValue(_msgSender(), value);
        }

        // 检查授权是否充足
        if (_allowances[from][_msgSender()] < value) {
            revert ERC20InsufficientAllowance(_msgSender(), _allowances[from][_msgSender()], value);
        }

        // 检查余额是否充足
        if (_balances[from] < value) {
            revert ERC20InsufficientBalance(_msgSender(), _balances[from], value);
        }

        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
    }
    


    function mint(uint value) public onlyOwner returns (bool){
        _mint(value);
        return true;
    }

    function _mint(uint value) internal {
        // 时间要求
        require(
            block.timestamp >= lastMintTime + MINT_INTERVAL,
            "Minting tokens is locked until one year has passed since the last minting."
        );

        // 数量要求
        require(
            value.mul(100) <= _totalSupply,
            "Can not mint over 1%."
        );
        // mint逻辑
        _totalSupply = _totalSupply.add(value);
        _balances[owner] = _balances[owner].add(value);

        //更新mint时间
        lastMintTime = block.timestamp;
        emit Mint(owner, value);
    }

    

    function burn(uint value) public onlyOwner returns (bool) {
        _burn(value); 
        return true;
    }

    function _burn(uint value) internal { //burn自己的代币
        // 检查余额是否充足
        if (_balances[owner] < value) revert ERC20InsufficientBalance(owner, balanceOf(owner), value);
        
        //修改总量和个人持有量
        _totalSupply = _totalSupply.sub(value);
        _balances[owner] = _balances[owner].sub(value);

        //广播
        emit Burn(owner, owner, value);
    }



    function burnFrom(address from, uint value) public returns (bool) {
        //调用内部函数
        _burnFrom(from, value);
        return true;
    }

    function _burnFrom(address from, uint value) internal {

        address burner = _msgSender();

        //检查value
        if (value <= 0) {
            revert ERC20InvalidValue(_msgSender(), value);
        }

        // 授权检查
        // 驳回授权为0的情况
        if (_allowancesForBurn[from][burner] == 0) {
            revert ERC20InvalidBurner(burner);
        }


        // 驳回授权值小于 value的情况
        if (_allowancesForBurn[from][burner] < value) {
            revert ERC20InsufficientAllowance(burner, _allowancesForBurn[from][burner], value);
        }

        // 驳回余额不充足的情况
        if (_balances[from] < value) {
            revert ERC20InsufficientBalance(burner, _balances[from], value);
        }

        // 修改总量和个人持有量
        _totalSupply = _totalSupply.sub(value);
        _balances[from] = _balances[from].sub(value);

        // 修改allowance
        _allowancesForBurn[from][burner] = _allowancesForBurn[from][burner].sub(value);

        // 广播
        emit Burn(from, burner, value);
    } 



    function approveForBurn(address burner, uint value) public returns (bool) {
        // 赋予权限
        _approveForBurn(burner, value);
        return true;
    }

    function _approveForBurn(address burner, uint value) internal {
        // 如果有权限且不为0，先清零再授权
        if (_allowancesForBurn[_msgSender()][burner] > 0 && value > 0) { 
            _allowancesForBurn[_msgSender()][burner] = 0;
        }

        //赋予权限
        _allowancesForBurn[_msgSender()][burner] = value;

        // 广播
        emit ApprovalForBurn(_msgSender(), burner, value);
    }

}
