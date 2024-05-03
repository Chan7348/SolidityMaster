# LOCK









## Methods

### allowance

```solidity
function allowance(address _owner, address _spender) external view returns (uint256 remaining)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _owner | address | undefined |
| _spender | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| remaining | uint256 | undefined |

### approve

```solidity
function approve(address _spender, uint256 _value) external nonpayable returns (bool success)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _spender | address | undefined |
| _value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| success | bool | undefined |

### balanceOf

```solidity
function balanceOf(address _owner) external view returns (uint256 balance)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _owner | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| balance | uint256 | undefined |

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

### getOwner

```solidity
function getOwner() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### mint

```solidity
function mint(uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### name

```solidity
function name() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

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
function transfer(address _to, uint256 _value) external nonpayable returns (bool success)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _to | address | undefined |
| _value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| success | bool | undefined |

### transferFrom

```solidity
function transferFrom(address _from, address _to, uint256 _value) external nonpayable returns (bool success)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _from | address | undefined |
| _to | address | undefined |
| _value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| success | bool | undefined |

### transferOwnership

```solidity
function transferOwnership(address _newOwner) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _newOwner | address | undefined |



## Events

### Approval

```solidity
event Approval(address _owner, address _spender, uint256 _value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _owner  | address | undefined |
| _spender  | address | undefined |
| _value  | uint256 | undefined |

### Transfer

```solidity
event Transfer(address _from, address _to, uint256 _value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _from  | address | undefined |
| _to  | address | undefined |
| _value  | uint256 | undefined |

### TransferOwnership

```solidity
event TransferOwnership(address oldOne, address newOne)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| oldOne  | address | undefined |
| newOne  | address | undefined |



## Errors

### ERC20InsufficientAllowance

```solidity
error ERC20InsufficientAllowance(address spender, address owner, uint256 need, uint256 value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| owner | address | undefined |
| need | uint256 | undefined |
| value | uint256 | undefined |

### ERC20InsufficientBalance

```solidity
error ERC20InsufficientBalance(address caller, address from, uint256 need, uint256 value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| caller | address | undefined |
| from | address | undefined |
| need | uint256 | undefined |
| value | uint256 | undefined |

### ERC20InvalidSpender

```solidity
error ERC20InvalidSpender(address spender, address owner)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| owner | address | undefined |

