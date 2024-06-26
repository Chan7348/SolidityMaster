# Test









## Methods

### IS_TEST

```solidity
function IS_TEST() external view returns (bool)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### excludeArtifacts

```solidity
function excludeArtifacts() external view returns (string[] excludedArtifacts_)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| excludedArtifacts_ | string[] | undefined |

### excludeContracts

```solidity
function excludeContracts() external view returns (address[] excludedContracts_)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| excludedContracts_ | address[] | undefined |

### excludeSenders

```solidity
function excludeSenders() external view returns (address[] excludedSenders_)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| excludedSenders_ | address[] | undefined |

### failed

```solidity
function failed() external view returns (bool)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### targetArtifactSelectors

```solidity
function targetArtifactSelectors() external view returns (struct StdInvariant.FuzzSelector[] targetedArtifactSelectors_)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| targetedArtifactSelectors_ | StdInvariant.FuzzSelector[] | undefined |

### targetArtifacts

```solidity
function targetArtifacts() external view returns (string[] targetedArtifacts_)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| targetedArtifacts_ | string[] | undefined |

### targetContracts

```solidity
function targetContracts() external view returns (address[] targetedContracts_)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| targetedContracts_ | address[] | undefined |

### targetInterfaces

```solidity
function targetInterfaces() external view returns (struct StdInvariant.FuzzInterface[] targetedInterfaces_)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| targetedInterfaces_ | StdInvariant.FuzzInterface[] | undefined |

### targetSelectors

```solidity
function targetSelectors() external view returns (struct StdInvariant.FuzzSelector[] targetedSelectors_)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| targetedSelectors_ | StdInvariant.FuzzSelector[] | undefined |

### targetSenders

```solidity
function targetSenders() external view returns (address[] targetedSenders_)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| targetedSenders_ | address[] | undefined |



## Events

### log

```solidity
event log(string)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0  | string | undefined |

### log_address

```solidity
event log_address(address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0  | address | undefined |

### log_array

```solidity
event log_array(address[] val)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| val  | address[] | undefined |

### log_bytes

```solidity
event log_bytes(bytes)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0  | bytes | undefined |

### log_bytes32

```solidity
event log_bytes32(bytes32)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0  | bytes32 | undefined |

### log_int

```solidity
event log_int(int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0  | int256 | undefined |

### log_named_address

```solidity
event log_named_address(string key, address val)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| key  | string | undefined |
| val  | address | undefined |

### log_named_array

```solidity
event log_named_array(string key, address[] val)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| key  | string | undefined |
| val  | address[] | undefined |

### log_named_bytes

```solidity
event log_named_bytes(string key, bytes val)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| key  | string | undefined |
| val  | bytes | undefined |

### log_named_bytes32

```solidity
event log_named_bytes32(string key, bytes32 val)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| key  | string | undefined |
| val  | bytes32 | undefined |

### log_named_decimal_int

```solidity
event log_named_decimal_int(string key, int256 val, uint256 decimals)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| key  | string | undefined |
| val  | int256 | undefined |
| decimals  | uint256 | undefined |

### log_named_decimal_uint

```solidity
event log_named_decimal_uint(string key, uint256 val, uint256 decimals)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| key  | string | undefined |
| val  | uint256 | undefined |
| decimals  | uint256 | undefined |

### log_named_int

```solidity
event log_named_int(string key, int256 val)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| key  | string | undefined |
| val  | int256 | undefined |

### log_named_string

```solidity
event log_named_string(string key, string val)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| key  | string | undefined |
| val  | string | undefined |

### log_named_uint

```solidity
event log_named_uint(string key, uint256 val)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| key  | string | undefined |
| val  | uint256 | undefined |

### log_string

```solidity
event log_string(string)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0  | string | undefined |

### log_uint

```solidity
event log_uint(uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0  | uint256 | undefined |

### logs

```solidity
event logs(bytes)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0  | bytes | undefined |



