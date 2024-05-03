# CRV









## Methods

### admin

```solidity
function admin() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### allowance

```solidity
function allowance(address owner, address spender) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |
| spender | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### approve

```solidity
function approve(address spender, uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### available_supply

```solidity
function available_supply() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### balanceOf

```solidity
function balanceOf(address) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### burn

```solidity
function burn(uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### decimals

```solidity
function decimals() external view returns (uint8)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint8 | undefined |

### future_epoch_time_write

```solidity
function future_epoch_time_write() external nonpayable returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### mining_epoch

```solidity
function mining_epoch() external view returns (int128)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int128 | undefined |

### mint

```solidity
function mint(address account, uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### mintable_in_timeframe

```solidity
function mintable_in_timeframe(uint256 start, uint256 end) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| start | uint256 | undefined |
| end | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### minter

```solidity
function minter() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### name

```solidity
function name() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### rate

```solidity
function rate() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### set_admin

```solidity
function set_admin(address _admin) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _admin | address | undefined |

### set_minter

```solidity
function set_minter(address _minter) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _minter | address | undefined |

### set_name

```solidity
function set_name(string _name, string _symbol) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _name | string | undefined |
| _symbol | string | undefined |

### start_epoch_time

```solidity
function start_epoch_time() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### start_epoch_time_write

```solidity
function start_epoch_time_write() external nonpayable returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### symbol

```solidity
function symbol() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### totalSupply

```solidity
function totalSupply() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### transfer

```solidity
function transfer(address recipient, uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| recipient | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### transferFrom

```solidity
function transferFrom(address sender, address recipient, uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| sender | address | undefined |
| recipient | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### update_mining_parameters

```solidity
function update_mining_parameters() external nonpayable
```








## Events

### Approval

```solidity
event Approval(address indexed owner, address indexed spender, uint256 value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| owner `indexed` | address | undefined |
| spender `indexed` | address | undefined |
| value  | uint256 | undefined |

### SetAdmin

```solidity
event SetAdmin(address admin)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| admin  | address | undefined |

### SetMinter

```solidity
event SetMinter(address minter)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| minter  | address | undefined |

### Transfer

```solidity
event Transfer(address indexed from, address indexed to, uint256 value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| from `indexed` | address | undefined |
| to `indexed` | address | undefined |
| value  | uint256 | undefined |

### UpdateMiningParameters

```solidity
event UpdateMiningParameters(uint256 time, uint256 rate, uint256 supply)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| time  | uint256 | undefined |
| rate  | uint256 | undefined |
| supply  | uint256 | undefined |



