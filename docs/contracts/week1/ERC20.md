# ERC20









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

### decimals

```solidity
function decimals() external view returns (uint8)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint8 | undefined |

### decimals_

```solidity
function decimals_() external view returns (uint8)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint8 | undefined |

### name

```solidity
function name() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### name_

```solidity
function name_() external view returns (string)
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

### symbol_

```solidity
function symbol_() external view returns (string)
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

### totalSupply_

```solidity
function totalSupply_() external view returns (uint256)
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


