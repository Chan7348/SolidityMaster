# FUTURE









## Methods

### MINT_INTERVAL

```solidity
function MINT_INTERVAL() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### _allowances

```solidity
function _allowances(address account, address spender) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| spender | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### _allowancesForBurn

```solidity
function _allowancesForBurn(address account, address burner) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| burner | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

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
function approve(address spender, uint256 value) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### approveForBurn

```solidity
function approveForBurn(address burner, uint256 value) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| burner | address | undefined |
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### balanceOf

```solidity
function balanceOf(address account) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### burn

```solidity
function burn(uint256 value) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### burnFrom

```solidity
function burnFrom(address from, uint256 value) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### decimals

```solidity
function decimals() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### lastMintTime

```solidity
function lastMintTime() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### mint

```solidity
function mint(uint256 value) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| value | uint256 | undefined |

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

### owner

```solidity
function owner() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

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
function transfer(address to, uint256 value) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### transferFrom

```solidity
function transferFrom(address from, address to, uint256 value) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### transferOwnership

```solidity
function transferOwnership(address newOwner) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newOwner | address | undefined |



## Events

### Approval

```solidity
event Approval(address indexed _owner, address indexed _spender, uint256 _value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _owner `indexed` | address | undefined |
| _spender `indexed` | address | undefined |
| _value  | uint256 | undefined |

### ApprovalForBurn

```solidity
event ApprovalForBurn(address owner, address burner, uint256 value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| owner  | address | undefined |
| burner  | address | undefined |
| value  | uint256 | undefined |

### Burn

```solidity
event Burn(address owner, address burner, uint256 value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| owner  | address | undefined |
| burner  | address | undefined |
| value  | uint256 | undefined |

### Mint

```solidity
event Mint(address minter, uint256 number)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| minter  | address | undefined |
| number  | uint256 | undefined |

### Transfer

```solidity
event Transfer(address indexed _from, address indexed _to, uint256 _value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _from `indexed` | address | undefined |
| _to `indexed` | address | undefined |
| _value  | uint256 | undefined |



## Errors

### ERC20InsufficientAllowance

```solidity
error ERC20InsufficientAllowance(address spender, uint256 allowance, uint256 needed)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| allowance | uint256 | undefined |
| needed | uint256 | undefined |

### ERC20InsufficientBalance

```solidity
error ERC20InsufficientBalance(address sender, uint256 balance, uint256 needed)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| sender | address | undefined |
| balance | uint256 | undefined |
| needed | uint256 | undefined |

### ERC20InvalidApprover

```solidity
error ERC20InvalidApprover(address approver)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| approver | address | undefined |

### ERC20InvalidBurner

```solidity
error ERC20InvalidBurner(address burner)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| burner | address | undefined |

### ERC20InvalidReceiver

```solidity
error ERC20InvalidReceiver(address receiver)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| receiver | address | undefined |

### ERC20InvalidSender

```solidity
error ERC20InvalidSender(address sender)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| sender | address | undefined |

### ERC20InvalidSpender

```solidity
error ERC20InvalidSpender(address spender)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |

### ERC20InvalidValue

```solidity
error ERC20InvalidValue(address sender, uint256 value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| sender | address | undefined |
| value | uint256 | undefined |


