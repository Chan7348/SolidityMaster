# VeLOCK









## Methods

### addLock

```solidity
function addLock(uint256 amount, uint256 duration) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| amount | uint256 | undefined |
| duration | uint256 | undefined |

### balanceOf

```solidity
function balanceOf(address user) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

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

### getVotingPower

```solidity
function getVotingPower(address user) external view returns (uint256 power, uint256 totalPower)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| power | uint256 | undefined |
| totalPower | uint256 | undefined |

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

### token

```solidity
function token() external view returns (contract LOCK)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract LOCK | undefined |

### totalSupply

```solidity
function totalSupply() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### transferOwnership

```solidity
function transferOwnership(address _newOwner) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _newOwner | address | undefined |

### users

```solidity
function users(uint256) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### withdrawLock

```solidity
function withdrawLock(uint256 index) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| index | uint256 | undefined |



## Events

### AddLock

```solidity
event AddLock(address indexed user, uint256 amount, uint256 duration)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| amount  | uint256 | undefined |
| duration  | uint256 | undefined |

### TransferOwnership

```solidity
event TransferOwnership(address oldOne, address newOne)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| oldOne  | address | undefined |
| newOne  | address | undefined |

### WithdrawLock

```solidity
event WithdrawLock(address indexed user, uint256 amount)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| amount  | uint256 | undefined |



