# IEERC314



> ERC314



*Implementation of the ERC314 interface. ERC314 is a derivative of ERC20 which aims to integrate a liquidity pool on the token in order to enable native swaps, notably to reduce gas consumption. *


## Events

### AddLiquidity

```solidity
event AddLiquidity(uint32 _blockToUnlockLiquidity, uint256 value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _blockToUnlockLiquidity  | uint32 | undefined |
| value  | uint256 | undefined |

### RemoveLiquidity

```solidity
event RemoveLiquidity(uint256 value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| value  | uint256 | undefined |

### Swap

```solidity
event Swap(address indexed sender, uint256 amount0In, uint256 amount1In, uint256 amount0Out, uint256 amount1Out)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| sender `indexed` | address | undefined |
| amount0In  | uint256 | undefined |
| amount1In  | uint256 | undefined |
| amount0Out  | uint256 | undefined |
| amount1Out  | uint256 | undefined |

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



