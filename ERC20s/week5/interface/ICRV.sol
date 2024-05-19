// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}
interface ICRV is IERC20 {
    event UpdateMiningParameters(uint time, uint rate, uint supply);
    event SetMinter(address minter);
    event SetAdmin(address admin);
    function update_mining_parameters() external;
    function start_epoch_time_write() external returns (uint);
    function future_epoch_time_write() external returns (uint);
    function available_supply() external view returns (uint);
    function mintable_in_timeframe(uint start, uint end) external view returns (uint);
    function set_minter(address minter) external;
    function set_admin(address admin) external;
    function set_name(string memory name, string memory symbol) external;
    function mint(address to, uint value) external returns (bool);
    function burn(uint value) external returns (bool);
    function minter() external view returns (address);
    function admin() external view returns (address);
}