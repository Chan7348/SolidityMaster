# IMulticall3









## Methods

### aggregate

```solidity
function aggregate(IMulticall3.Call[] calls) external payable returns (uint256 blockNumber, bytes[] returnData)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| calls | IMulticall3.Call[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| blockNumber | uint256 | undefined |
| returnData | bytes[] | undefined |

### aggregate3

```solidity
function aggregate3(IMulticall3.Call3[] calls) external payable returns (struct IMulticall3.Result[] returnData)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| calls | IMulticall3.Call3[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| returnData | IMulticall3.Result[] | undefined |

### aggregate3Value

```solidity
function aggregate3Value(IMulticall3.Call3Value[] calls) external payable returns (struct IMulticall3.Result[] returnData)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| calls | IMulticall3.Call3Value[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| returnData | IMulticall3.Result[] | undefined |

### blockAndAggregate

```solidity
function blockAndAggregate(IMulticall3.Call[] calls) external payable returns (uint256 blockNumber, bytes32 blockHash, struct IMulticall3.Result[] returnData)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| calls | IMulticall3.Call[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| blockNumber | uint256 | undefined |
| blockHash | bytes32 | undefined |
| returnData | IMulticall3.Result[] | undefined |

### getBasefee

```solidity
function getBasefee() external view returns (uint256 basefee)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| basefee | uint256 | undefined |

### getBlockHash

```solidity
function getBlockHash(uint256 blockNumber) external view returns (bytes32 blockHash)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| blockNumber | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| blockHash | bytes32 | undefined |

### getBlockNumber

```solidity
function getBlockNumber() external view returns (uint256 blockNumber)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| blockNumber | uint256 | undefined |

### getChainId

```solidity
function getChainId() external view returns (uint256 chainid)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| chainid | uint256 | undefined |

### getCurrentBlockCoinbase

```solidity
function getCurrentBlockCoinbase() external view returns (address coinbase)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| coinbase | address | undefined |

### getCurrentBlockDifficulty

```solidity
function getCurrentBlockDifficulty() external view returns (uint256 difficulty)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| difficulty | uint256 | undefined |

### getCurrentBlockGasLimit

```solidity
function getCurrentBlockGasLimit() external view returns (uint256 gaslimit)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| gaslimit | uint256 | undefined |

### getCurrentBlockTimestamp

```solidity
function getCurrentBlockTimestamp() external view returns (uint256 timestamp)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| timestamp | uint256 | undefined |

### getEthBalance

```solidity
function getEthBalance(address addr) external view returns (uint256 balance)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| addr | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| balance | uint256 | undefined |

### getLastBlockHash

```solidity
function getLastBlockHash() external view returns (bytes32 blockHash)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| blockHash | bytes32 | undefined |

### tryAggregate

```solidity
function tryAggregate(bool requireSuccess, IMulticall3.Call[] calls) external payable returns (struct IMulticall3.Result[] returnData)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| requireSuccess | bool | undefined |
| calls | IMulticall3.Call[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| returnData | IMulticall3.Result[] | undefined |

### tryBlockAndAggregate

```solidity
function tryBlockAndAggregate(bool requireSuccess, IMulticall3.Call[] calls) external payable returns (uint256 blockNumber, bytes32 blockHash, struct IMulticall3.Result[] returnData)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| requireSuccess | bool | undefined |
| calls | IMulticall3.Call[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| blockNumber | uint256 | undefined |
| blockHash | bytes32 | undefined |
| returnData | IMulticall3.Result[] | undefined |




