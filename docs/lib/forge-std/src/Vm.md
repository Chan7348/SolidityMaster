# Vm





The `Vm` interface does allow manipulation of the EVM state. These are all intended to be used in tests, but it is not recommended to use these cheats in scripts.



## Methods

### accesses

```solidity
function accesses(address target) external nonpayable returns (bytes32[] readSlots, bytes32[] writeSlots)
```

Gets all accessed reads and write slot from a `vm.record` session, for a given address.



#### Parameters

| Name | Type | Description |
|---|---|---|
| target | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| readSlots | bytes32[] | undefined |
| writeSlots | bytes32[] | undefined |

### activeFork

```solidity
function activeFork() external view returns (uint256 forkId)
```

Returns the identifier of the currently active fork. Reverts if no fork is currently active.




#### Returns

| Name | Type | Description |
|---|---|---|
| forkId | uint256 | undefined |

### addr

```solidity
function addr(uint256 privateKey) external pure returns (address keyAddr)
```

Gets the address for a given private key.



#### Parameters

| Name | Type | Description |
|---|---|---|
| privateKey | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| keyAddr | address | undefined |

### allowCheatcodes

```solidity
function allowCheatcodes(address account) external nonpayable
```

In forking mode, explicitly grant the given address cheatcode access.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

### assertApproxEqAbs

```solidity
function assertApproxEqAbs(uint256 left, uint256 right, uint256 maxDelta) external pure
```

Compares two `uint256` values. Expects difference to be less than or equal to `maxDelta`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| maxDelta | uint256 | undefined |

### assertApproxEqAbs

```solidity
function assertApproxEqAbs(int256 left, int256 right, uint256 maxDelta) external pure
```

Compares two `int256` values. Expects difference to be less than or equal to `maxDelta`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| maxDelta | uint256 | undefined |

### assertApproxEqAbs

```solidity
function assertApproxEqAbs(int256 left, int256 right, uint256 maxDelta, string error) external pure
```

Compares two `int256` values. Expects difference to be less than or equal to `maxDelta`. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| maxDelta | uint256 | undefined |
| error | string | undefined |

### assertApproxEqAbs

```solidity
function assertApproxEqAbs(uint256 left, uint256 right, uint256 maxDelta, string error) external pure
```

Compares two `uint256` values. Expects difference to be less than or equal to `maxDelta`. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| maxDelta | uint256 | undefined |
| error | string | undefined |

### assertApproxEqAbsDecimal

```solidity
function assertApproxEqAbsDecimal(uint256 left, uint256 right, uint256 maxDelta, uint256 decimals) external pure
```

Compares two `uint256` values. Expects difference to be less than or equal to `maxDelta`. Formats values with decimals in failure message.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| maxDelta | uint256 | undefined |
| decimals | uint256 | undefined |

### assertApproxEqAbsDecimal

```solidity
function assertApproxEqAbsDecimal(int256 left, int256 right, uint256 maxDelta, uint256 decimals) external pure
```

Compares two `int256` values. Expects difference to be less than or equal to `maxDelta`. Formats values with decimals in failure message.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| maxDelta | uint256 | undefined |
| decimals | uint256 | undefined |

### assertApproxEqAbsDecimal

```solidity
function assertApproxEqAbsDecimal(uint256 left, uint256 right, uint256 maxDelta, uint256 decimals, string error) external pure
```

Compares two `uint256` values. Expects difference to be less than or equal to `maxDelta`. Formats values with decimals in failure message. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| maxDelta | uint256 | undefined |
| decimals | uint256 | undefined |
| error | string | undefined |

### assertApproxEqAbsDecimal

```solidity
function assertApproxEqAbsDecimal(int256 left, int256 right, uint256 maxDelta, uint256 decimals, string error) external pure
```

Compares two `int256` values. Expects difference to be less than or equal to `maxDelta`. Formats values with decimals in failure message. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| maxDelta | uint256 | undefined |
| decimals | uint256 | undefined |
| error | string | undefined |

### assertApproxEqRel

```solidity
function assertApproxEqRel(uint256 left, uint256 right, uint256 maxPercentDelta, string error) external pure
```

Compares two `uint256` values. Expects relative difference in percents to be less than or equal to `maxPercentDelta`. `maxPercentDelta` is an 18 decimal fixed point number, where 1e18 == 100% Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| maxPercentDelta | uint256 | undefined |
| error | string | undefined |

### assertApproxEqRel

```solidity
function assertApproxEqRel(uint256 left, uint256 right, uint256 maxPercentDelta) external pure
```

Compares two `uint256` values. Expects relative difference in percents to be less than or equal to `maxPercentDelta`. `maxPercentDelta` is an 18 decimal fixed point number, where 1e18 == 100%



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| maxPercentDelta | uint256 | undefined |

### assertApproxEqRel

```solidity
function assertApproxEqRel(int256 left, int256 right, uint256 maxPercentDelta, string error) external pure
```

Compares two `int256` values. Expects relative difference in percents to be less than or equal to `maxPercentDelta`. `maxPercentDelta` is an 18 decimal fixed point number, where 1e18 == 100% Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| maxPercentDelta | uint256 | undefined |
| error | string | undefined |

### assertApproxEqRel

```solidity
function assertApproxEqRel(int256 left, int256 right, uint256 maxPercentDelta) external pure
```

Compares two `int256` values. Expects relative difference in percents to be less than or equal to `maxPercentDelta`. `maxPercentDelta` is an 18 decimal fixed point number, where 1e18 == 100%



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| maxPercentDelta | uint256 | undefined |

### assertApproxEqRelDecimal

```solidity
function assertApproxEqRelDecimal(uint256 left, uint256 right, uint256 maxPercentDelta, uint256 decimals) external pure
```

Compares two `uint256` values. Expects relative difference in percents to be less than or equal to `maxPercentDelta`. `maxPercentDelta` is an 18 decimal fixed point number, where 1e18 == 100% Formats values with decimals in failure message.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| maxPercentDelta | uint256 | undefined |
| decimals | uint256 | undefined |

### assertApproxEqRelDecimal

```solidity
function assertApproxEqRelDecimal(uint256 left, uint256 right, uint256 maxPercentDelta, uint256 decimals, string error) external pure
```

Compares two `uint256` values. Expects relative difference in percents to be less than or equal to `maxPercentDelta`. `maxPercentDelta` is an 18 decimal fixed point number, where 1e18 == 100% Formats values with decimals in failure message. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| maxPercentDelta | uint256 | undefined |
| decimals | uint256 | undefined |
| error | string | undefined |

### assertApproxEqRelDecimal

```solidity
function assertApproxEqRelDecimal(int256 left, int256 right, uint256 maxPercentDelta, uint256 decimals) external pure
```

Compares two `int256` values. Expects relative difference in percents to be less than or equal to `maxPercentDelta`. `maxPercentDelta` is an 18 decimal fixed point number, where 1e18 == 100% Formats values with decimals in failure message.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| maxPercentDelta | uint256 | undefined |
| decimals | uint256 | undefined |

### assertApproxEqRelDecimal

```solidity
function assertApproxEqRelDecimal(int256 left, int256 right, uint256 maxPercentDelta, uint256 decimals, string error) external pure
```

Compares two `int256` values. Expects relative difference in percents to be less than or equal to `maxPercentDelta`. `maxPercentDelta` is an 18 decimal fixed point number, where 1e18 == 100% Formats values with decimals in failure message. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| maxPercentDelta | uint256 | undefined |
| decimals | uint256 | undefined |
| error | string | undefined |

### assertEq

```solidity
function assertEq(bytes32[] left, bytes32[] right) external pure
```

Asserts that two arrays of `bytes32` values are equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bytes32[] | undefined |
| right | bytes32[] | undefined |

### assertEq

```solidity
function assertEq(int256[] left, int256[] right, string error) external pure
```

Asserts that two arrays of `int256` values are equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256[] | undefined |
| right | int256[] | undefined |
| error | string | undefined |

### assertEq

```solidity
function assertEq(address left, address right, string error) external pure
```

Asserts that two `address` values are equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | address | undefined |
| right | address | undefined |
| error | string | undefined |

### assertEq

```solidity
function assertEq(string left, string right, string error) external pure
```

Asserts that two `string` values are equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | string | undefined |
| right | string | undefined |
| error | string | undefined |

### assertEq

```solidity
function assertEq(address[] left, address[] right) external pure
```

Asserts that two arrays of `address` values are equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | address[] | undefined |
| right | address[] | undefined |

### assertEq

```solidity
function assertEq(address[] left, address[] right, string error) external pure
```

Asserts that two arrays of `address` values are equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | address[] | undefined |
| right | address[] | undefined |
| error | string | undefined |

### assertEq

```solidity
function assertEq(bool left, bool right, string error) external pure
```

Asserts that two `bool` values are equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bool | undefined |
| right | bool | undefined |
| error | string | undefined |

### assertEq

```solidity
function assertEq(address left, address right) external pure
```

Asserts that two `address` values are equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | address | undefined |
| right | address | undefined |

### assertEq

```solidity
function assertEq(uint256[] left, uint256[] right, string error) external pure
```

Asserts that two arrays of `uint256` values are equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256[] | undefined |
| right | uint256[] | undefined |
| error | string | undefined |

### assertEq

```solidity
function assertEq(bool[] left, bool[] right) external pure
```

Asserts that two arrays of `bool` values are equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bool[] | undefined |
| right | bool[] | undefined |

### assertEq

```solidity
function assertEq(int256[] left, int256[] right) external pure
```

Asserts that two arrays of `int256` values are equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256[] | undefined |
| right | int256[] | undefined |

### assertEq

```solidity
function assertEq(int256 left, int256 right, string error) external pure
```

Asserts that two `int256` values are equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| error | string | undefined |

### assertEq

```solidity
function assertEq(bytes32 left, bytes32 right) external pure
```

Asserts that two `bytes32` values are equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bytes32 | undefined |
| right | bytes32 | undefined |

### assertEq

```solidity
function assertEq(uint256 left, uint256 right, string error) external pure
```

Asserts that two `uint256` values are equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| error | string | undefined |

### assertEq

```solidity
function assertEq(uint256[] left, uint256[] right) external pure
```

Asserts that two arrays of `uint256 values are equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256[] | undefined |
| right | uint256[] | undefined |

### assertEq

```solidity
function assertEq(bytes left, bytes right) external pure
```

Asserts that two `bytes` values are equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bytes | undefined |
| right | bytes | undefined |

### assertEq

```solidity
function assertEq(uint256 left, uint256 right) external pure
```

Asserts that two `uint256` values are equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |

### assertEq

```solidity
function assertEq(bytes32 left, bytes32 right, string error) external pure
```

Asserts that two `bytes32` values are equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bytes32 | undefined |
| right | bytes32 | undefined |
| error | string | undefined |

### assertEq

```solidity
function assertEq(string[] left, string[] right) external pure
```

Asserts that two arrays of `string` values are equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | string[] | undefined |
| right | string[] | undefined |

### assertEq

```solidity
function assertEq(bytes32[] left, bytes32[] right, string error) external pure
```

Asserts that two arrays of `bytes32` values are equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bytes32[] | undefined |
| right | bytes32[] | undefined |
| error | string | undefined |

### assertEq

```solidity
function assertEq(bytes left, bytes right, string error) external pure
```

Asserts that two `bytes` values are equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bytes | undefined |
| right | bytes | undefined |
| error | string | undefined |

### assertEq

```solidity
function assertEq(bool[] left, bool[] right, string error) external pure
```

Asserts that two arrays of `bool` values are equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bool[] | undefined |
| right | bool[] | undefined |
| error | string | undefined |

### assertEq

```solidity
function assertEq(bytes[] left, bytes[] right) external pure
```

Asserts that two arrays of `bytes` values are equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bytes[] | undefined |
| right | bytes[] | undefined |

### assertEq

```solidity
function assertEq(string[] left, string[] right, string error) external pure
```

Asserts that two arrays of `string` values are equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | string[] | undefined |
| right | string[] | undefined |
| error | string | undefined |

### assertEq

```solidity
function assertEq(string left, string right) external pure
```

Asserts that two `string` values are equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | string | undefined |
| right | string | undefined |

### assertEq

```solidity
function assertEq(bytes[] left, bytes[] right, string error) external pure
```

Asserts that two arrays of `bytes` values are equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bytes[] | undefined |
| right | bytes[] | undefined |
| error | string | undefined |

### assertEq

```solidity
function assertEq(bool left, bool right) external pure
```

Asserts that two `bool` values are equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bool | undefined |
| right | bool | undefined |

### assertEq

```solidity
function assertEq(int256 left, int256 right) external pure
```

Asserts that two `int256` values are equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |

### assertEqDecimal

```solidity
function assertEqDecimal(uint256 left, uint256 right, uint256 decimals) external pure
```

Asserts that two `uint256` values are equal, formatting them with decimals in failure message.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| decimals | uint256 | undefined |

### assertEqDecimal

```solidity
function assertEqDecimal(int256 left, int256 right, uint256 decimals) external pure
```

Asserts that two `int256` values are equal, formatting them with decimals in failure message.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| decimals | uint256 | undefined |

### assertEqDecimal

```solidity
function assertEqDecimal(int256 left, int256 right, uint256 decimals, string error) external pure
```

Asserts that two `int256` values are equal, formatting them with decimals in failure message. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| decimals | uint256 | undefined |
| error | string | undefined |

### assertEqDecimal

```solidity
function assertEqDecimal(uint256 left, uint256 right, uint256 decimals, string error) external pure
```

Asserts that two `uint256` values are equal, formatting them with decimals in failure message. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| decimals | uint256 | undefined |
| error | string | undefined |

### assertFalse

```solidity
function assertFalse(bool condition, string error) external pure
```

Asserts that the given condition is false and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| condition | bool | undefined |
| error | string | undefined |

### assertFalse

```solidity
function assertFalse(bool condition) external pure
```

Asserts that the given condition is false.



#### Parameters

| Name | Type | Description |
|---|---|---|
| condition | bool | undefined |

### assertGe

```solidity
function assertGe(int256 left, int256 right) external pure
```

Compares two `int256` values. Expects first value to be greater than or equal to second.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |

### assertGe

```solidity
function assertGe(int256 left, int256 right, string error) external pure
```

Compares two `int256` values. Expects first value to be greater than or equal to second. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| error | string | undefined |

### assertGe

```solidity
function assertGe(uint256 left, uint256 right) external pure
```

Compares two `uint256` values. Expects first value to be greater than or equal to second.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |

### assertGe

```solidity
function assertGe(uint256 left, uint256 right, string error) external pure
```

Compares two `uint256` values. Expects first value to be greater than or equal to second. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| error | string | undefined |

### assertGeDecimal

```solidity
function assertGeDecimal(uint256 left, uint256 right, uint256 decimals) external pure
```

Compares two `uint256` values. Expects first value to be greater than or equal to second. Formats values with decimals in failure message.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| decimals | uint256 | undefined |

### assertGeDecimal

```solidity
function assertGeDecimal(int256 left, int256 right, uint256 decimals, string error) external pure
```

Compares two `int256` values. Expects first value to be greater than or equal to second. Formats values with decimals in failure message. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| decimals | uint256 | undefined |
| error | string | undefined |

### assertGeDecimal

```solidity
function assertGeDecimal(uint256 left, uint256 right, uint256 decimals, string error) external pure
```

Compares two `uint256` values. Expects first value to be greater than or equal to second. Formats values with decimals in failure message. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| decimals | uint256 | undefined |
| error | string | undefined |

### assertGeDecimal

```solidity
function assertGeDecimal(int256 left, int256 right, uint256 decimals) external pure
```

Compares two `int256` values. Expects first value to be greater than or equal to second. Formats values with decimals in failure message.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| decimals | uint256 | undefined |

### assertGt

```solidity
function assertGt(int256 left, int256 right) external pure
```

Compares two `int256` values. Expects first value to be greater than second.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |

### assertGt

```solidity
function assertGt(uint256 left, uint256 right, string error) external pure
```

Compares two `uint256` values. Expects first value to be greater than second. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| error | string | undefined |

### assertGt

```solidity
function assertGt(uint256 left, uint256 right) external pure
```

Compares two `uint256` values. Expects first value to be greater than second.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |

### assertGt

```solidity
function assertGt(int256 left, int256 right, string error) external pure
```

Compares two `int256` values. Expects first value to be greater than second. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| error | string | undefined |

### assertGtDecimal

```solidity
function assertGtDecimal(int256 left, int256 right, uint256 decimals, string error) external pure
```

Compares two `int256` values. Expects first value to be greater than second. Formats values with decimals in failure message. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| decimals | uint256 | undefined |
| error | string | undefined |

### assertGtDecimal

```solidity
function assertGtDecimal(uint256 left, uint256 right, uint256 decimals, string error) external pure
```

Compares two `uint256` values. Expects first value to be greater than second. Formats values with decimals in failure message. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| decimals | uint256 | undefined |
| error | string | undefined |

### assertGtDecimal

```solidity
function assertGtDecimal(int256 left, int256 right, uint256 decimals) external pure
```

Compares two `int256` values. Expects first value to be greater than second. Formats values with decimals in failure message.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| decimals | uint256 | undefined |

### assertGtDecimal

```solidity
function assertGtDecimal(uint256 left, uint256 right, uint256 decimals) external pure
```

Compares two `uint256` values. Expects first value to be greater than second. Formats values with decimals in failure message.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| decimals | uint256 | undefined |

### assertLe

```solidity
function assertLe(int256 left, int256 right, string error) external pure
```

Compares two `int256` values. Expects first value to be less than or equal to second. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| error | string | undefined |

### assertLe

```solidity
function assertLe(uint256 left, uint256 right) external pure
```

Compares two `uint256` values. Expects first value to be less than or equal to second.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |

### assertLe

```solidity
function assertLe(int256 left, int256 right) external pure
```

Compares two `int256` values. Expects first value to be less than or equal to second.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |

### assertLe

```solidity
function assertLe(uint256 left, uint256 right, string error) external pure
```

Compares two `uint256` values. Expects first value to be less than or equal to second. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| error | string | undefined |

### assertLeDecimal

```solidity
function assertLeDecimal(int256 left, int256 right, uint256 decimals) external pure
```

Compares two `int256` values. Expects first value to be less than or equal to second. Formats values with decimals in failure message.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| decimals | uint256 | undefined |

### assertLeDecimal

```solidity
function assertLeDecimal(uint256 left, uint256 right, uint256 decimals, string error) external pure
```

Compares two `uint256` values. Expects first value to be less than or equal to second. Formats values with decimals in failure message. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| decimals | uint256 | undefined |
| error | string | undefined |

### assertLeDecimal

```solidity
function assertLeDecimal(int256 left, int256 right, uint256 decimals, string error) external pure
```

Compares two `int256` values. Expects first value to be less than or equal to second. Formats values with decimals in failure message. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| decimals | uint256 | undefined |
| error | string | undefined |

### assertLeDecimal

```solidity
function assertLeDecimal(uint256 left, uint256 right, uint256 decimals) external pure
```

Compares two `uint256` values. Expects first value to be less than or equal to second. Formats values with decimals in failure message.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| decimals | uint256 | undefined |

### assertLt

```solidity
function assertLt(int256 left, int256 right) external pure
```

Compares two `int256` values. Expects first value to be less than second.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |

### assertLt

```solidity
function assertLt(uint256 left, uint256 right, string error) external pure
```

Compares two `uint256` values. Expects first value to be less than second. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| error | string | undefined |

### assertLt

```solidity
function assertLt(int256 left, int256 right, string error) external pure
```

Compares two `int256` values. Expects first value to be less than second. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| error | string | undefined |

### assertLt

```solidity
function assertLt(uint256 left, uint256 right) external pure
```

Compares two `uint256` values. Expects first value to be less than second.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |

### assertLtDecimal

```solidity
function assertLtDecimal(uint256 left, uint256 right, uint256 decimals) external pure
```

Compares two `uint256` values. Expects first value to be less than second. Formats values with decimals in failure message.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| decimals | uint256 | undefined |

### assertLtDecimal

```solidity
function assertLtDecimal(int256 left, int256 right, uint256 decimals, string error) external pure
```

Compares two `int256` values. Expects first value to be less than second. Formats values with decimals in failure message. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| decimals | uint256 | undefined |
| error | string | undefined |

### assertLtDecimal

```solidity
function assertLtDecimal(uint256 left, uint256 right, uint256 decimals, string error) external pure
```

Compares two `uint256` values. Expects first value to be less than second. Formats values with decimals in failure message. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| decimals | uint256 | undefined |
| error | string | undefined |

### assertLtDecimal

```solidity
function assertLtDecimal(int256 left, int256 right, uint256 decimals) external pure
```

Compares two `int256` values. Expects first value to be less than second. Formats values with decimals in failure message.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| decimals | uint256 | undefined |

### assertNotEq

```solidity
function assertNotEq(bytes32[] left, bytes32[] right) external pure
```

Asserts that two arrays of `bytes32` values are not equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bytes32[] | undefined |
| right | bytes32[] | undefined |

### assertNotEq

```solidity
function assertNotEq(int256[] left, int256[] right) external pure
```

Asserts that two arrays of `int256` values are not equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256[] | undefined |
| right | int256[] | undefined |

### assertNotEq

```solidity
function assertNotEq(bool left, bool right, string error) external pure
```

Asserts that two `bool` values are not equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bool | undefined |
| right | bool | undefined |
| error | string | undefined |

### assertNotEq

```solidity
function assertNotEq(bytes[] left, bytes[] right, string error) external pure
```

Asserts that two arrays of `bytes` values are not equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bytes[] | undefined |
| right | bytes[] | undefined |
| error | string | undefined |

### assertNotEq

```solidity
function assertNotEq(bool left, bool right) external pure
```

Asserts that two `bool` values are not equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bool | undefined |
| right | bool | undefined |

### assertNotEq

```solidity
function assertNotEq(bool[] left, bool[] right) external pure
```

Asserts that two arrays of `bool` values are not equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bool[] | undefined |
| right | bool[] | undefined |

### assertNotEq

```solidity
function assertNotEq(bytes left, bytes right) external pure
```

Asserts that two `bytes` values are not equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bytes | undefined |
| right | bytes | undefined |

### assertNotEq

```solidity
function assertNotEq(address[] left, address[] right) external pure
```

Asserts that two arrays of `address` values are not equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | address[] | undefined |
| right | address[] | undefined |

### assertNotEq

```solidity
function assertNotEq(int256 left, int256 right, string error) external pure
```

Asserts that two `int256` values are not equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| error | string | undefined |

### assertNotEq

```solidity
function assertNotEq(uint256[] left, uint256[] right) external pure
```

Asserts that two arrays of `uint256` values are not equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256[] | undefined |
| right | uint256[] | undefined |

### assertNotEq

```solidity
function assertNotEq(bool[] left, bool[] right, string error) external pure
```

Asserts that two arrays of `bool` values are not equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bool[] | undefined |
| right | bool[] | undefined |
| error | string | undefined |

### assertNotEq

```solidity
function assertNotEq(string left, string right) external pure
```

Asserts that two `string` values are not equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | string | undefined |
| right | string | undefined |

### assertNotEq

```solidity
function assertNotEq(address[] left, address[] right, string error) external pure
```

Asserts that two arrays of `address` values are not equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | address[] | undefined |
| right | address[] | undefined |
| error | string | undefined |

### assertNotEq

```solidity
function assertNotEq(string left, string right, string error) external pure
```

Asserts that two `string` values are not equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | string | undefined |
| right | string | undefined |
| error | string | undefined |

### assertNotEq

```solidity
function assertNotEq(address left, address right, string error) external pure
```

Asserts that two `address` values are not equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | address | undefined |
| right | address | undefined |
| error | string | undefined |

### assertNotEq

```solidity
function assertNotEq(bytes32 left, bytes32 right) external pure
```

Asserts that two `bytes32` values are not equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bytes32 | undefined |
| right | bytes32 | undefined |

### assertNotEq

```solidity
function assertNotEq(bytes left, bytes right, string error) external pure
```

Asserts that two `bytes` values are not equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bytes | undefined |
| right | bytes | undefined |
| error | string | undefined |

### assertNotEq

```solidity
function assertNotEq(uint256 left, uint256 right, string error) external pure
```

Asserts that two `uint256` values are not equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| error | string | undefined |

### assertNotEq

```solidity
function assertNotEq(uint256[] left, uint256[] right, string error) external pure
```

Asserts that two arrays of `uint256` values are not equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256[] | undefined |
| right | uint256[] | undefined |
| error | string | undefined |

### assertNotEq

```solidity
function assertNotEq(address left, address right) external pure
```

Asserts that two `address` values are not equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | address | undefined |
| right | address | undefined |

### assertNotEq

```solidity
function assertNotEq(bytes32 left, bytes32 right, string error) external pure
```

Asserts that two `bytes32` values are not equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bytes32 | undefined |
| right | bytes32 | undefined |
| error | string | undefined |

### assertNotEq

```solidity
function assertNotEq(string[] left, string[] right, string error) external pure
```

Asserts that two arrays of `string` values are not equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | string[] | undefined |
| right | string[] | undefined |
| error | string | undefined |

### assertNotEq

```solidity
function assertNotEq(uint256 left, uint256 right) external pure
```

Asserts that two `uint256` values are not equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |

### assertNotEq

```solidity
function assertNotEq(bytes32[] left, bytes32[] right, string error) external pure
```

Asserts that two arrays of `bytes32` values are not equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bytes32[] | undefined |
| right | bytes32[] | undefined |
| error | string | undefined |

### assertNotEq

```solidity
function assertNotEq(string[] left, string[] right) external pure
```

Asserts that two arrays of `string` values are not equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | string[] | undefined |
| right | string[] | undefined |

### assertNotEq

```solidity
function assertNotEq(int256[] left, int256[] right, string error) external pure
```

Asserts that two arrays of `int256` values are not equal and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256[] | undefined |
| right | int256[] | undefined |
| error | string | undefined |

### assertNotEq

```solidity
function assertNotEq(bytes[] left, bytes[] right) external pure
```

Asserts that two arrays of `bytes` values are not equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | bytes[] | undefined |
| right | bytes[] | undefined |

### assertNotEq

```solidity
function assertNotEq(int256 left, int256 right) external pure
```

Asserts that two `int256` values are not equal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |

### assertNotEqDecimal

```solidity
function assertNotEqDecimal(int256 left, int256 right, uint256 decimals) external pure
```

Asserts that two `int256` values are not equal, formatting them with decimals in failure message.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| decimals | uint256 | undefined |

### assertNotEqDecimal

```solidity
function assertNotEqDecimal(int256 left, int256 right, uint256 decimals, string error) external pure
```

Asserts that two `int256` values are not equal, formatting them with decimals in failure message. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | int256 | undefined |
| right | int256 | undefined |
| decimals | uint256 | undefined |
| error | string | undefined |

### assertNotEqDecimal

```solidity
function assertNotEqDecimal(uint256 left, uint256 right, uint256 decimals) external pure
```

Asserts that two `uint256` values are not equal, formatting them with decimals in failure message.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| decimals | uint256 | undefined |

### assertNotEqDecimal

```solidity
function assertNotEqDecimal(uint256 left, uint256 right, uint256 decimals, string error) external pure
```

Asserts that two `uint256` values are not equal, formatting them with decimals in failure message. Includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| left | uint256 | undefined |
| right | uint256 | undefined |
| decimals | uint256 | undefined |
| error | string | undefined |

### assertTrue

```solidity
function assertTrue(bool condition) external pure
```

Asserts that the given condition is true.



#### Parameters

| Name | Type | Description |
|---|---|---|
| condition | bool | undefined |

### assertTrue

```solidity
function assertTrue(bool condition, string error) external pure
```

Asserts that the given condition is true and includes error message into revert string on failure.



#### Parameters

| Name | Type | Description |
|---|---|---|
| condition | bool | undefined |
| error | string | undefined |

### assume

```solidity
function assume(bool condition) external pure
```

If the condition is false, discard this run&#39;s fuzz inputs and generate new ones.



#### Parameters

| Name | Type | Description |
|---|---|---|
| condition | bool | undefined |

### breakpoint

```solidity
function breakpoint(string char) external nonpayable
```

Writes a breakpoint to jump to in the debugger.



#### Parameters

| Name | Type | Description |
|---|---|---|
| char | string | undefined |

### breakpoint

```solidity
function breakpoint(string char, bool value) external nonpayable
```

Writes a conditional breakpoint to jump to in the debugger.



#### Parameters

| Name | Type | Description |
|---|---|---|
| char | string | undefined |
| value | bool | undefined |

### broadcast

```solidity
function broadcast() external nonpayable
```

Using the address that calls the test contract, has the next call (at this call depth only) create a transaction that can later be signed and sent onchain.




### broadcast

```solidity
function broadcast(address signer) external nonpayable
```

Has the next call (at this call depth only) create a transaction with the address provided as the sender that can later be signed and sent onchain.



#### Parameters

| Name | Type | Description |
|---|---|---|
| signer | address | undefined |

### broadcast

```solidity
function broadcast(uint256 privateKey) external nonpayable
```

Has the next call (at this call depth only) create a transaction with the private key provided as the sender that can later be signed and sent onchain.



#### Parameters

| Name | Type | Description |
|---|---|---|
| privateKey | uint256 | undefined |

### chainId

```solidity
function chainId(uint256 newChainId) external nonpayable
```

Sets `block.chainid`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| newChainId | uint256 | undefined |

### clearMockedCalls

```solidity
function clearMockedCalls() external nonpayable
```

Clears all mocked calls.




### closeFile

```solidity
function closeFile(string path) external nonpayable
```

Closes file for reading, resetting the offset and allowing to read it from beginning with readLine. `path` is relative to the project root.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |

### coinbase

```solidity
function coinbase(address newCoinbase) external nonpayable
```

Sets `block.coinbase`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| newCoinbase | address | undefined |

### computeCreate2Address

```solidity
function computeCreate2Address(bytes32 salt, bytes32 initCodeHash) external pure returns (address)
```

Compute the address of a contract created with CREATE2 using the default CREATE2 deployer.



#### Parameters

| Name | Type | Description |
|---|---|---|
| salt | bytes32 | undefined |
| initCodeHash | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### computeCreate2Address

```solidity
function computeCreate2Address(bytes32 salt, bytes32 initCodeHash, address deployer) external pure returns (address)
```

Compute the address of a contract created with CREATE2 using the given CREATE2 deployer.



#### Parameters

| Name | Type | Description |
|---|---|---|
| salt | bytes32 | undefined |
| initCodeHash | bytes32 | undefined |
| deployer | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### computeCreateAddress

```solidity
function computeCreateAddress(address deployer, uint256 nonce) external pure returns (address)
```

Compute the address a contract will be deployed at for a given deployer address and nonce.



#### Parameters

| Name | Type | Description |
|---|---|---|
| deployer | address | undefined |
| nonce | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### copyFile

```solidity
function copyFile(string from, string to) external nonpayable returns (uint64 copied)
```

Copies the contents of one file to another. This function will **overwrite** the contents of `to`. On success, the total number of bytes copied is returned and it is equal to the length of the `to` file as reported by `metadata`. Both `from` and `to` are relative to the project root.



#### Parameters

| Name | Type | Description |
|---|---|---|
| from | string | undefined |
| to | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| copied | uint64 | undefined |

### createDir

```solidity
function createDir(string path, bool recursive) external nonpayable
```

Creates a new, empty directory at the provided path. This cheatcode will revert in the following situations, but is not limited to just these cases: - User lacks permissions to modify `path`. - A parent of the given path doesn&#39;t exist and `recursive` is false. - `path` already exists and `recursive` is false. `path` is relative to the project root.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |
| recursive | bool | undefined |

### createFork

```solidity
function createFork(string urlOrAlias) external nonpayable returns (uint256 forkId)
```

Creates a new fork with the given endpoint and the _latest_ block and returns the identifier of the fork.



#### Parameters

| Name | Type | Description |
|---|---|---|
| urlOrAlias | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| forkId | uint256 | undefined |

### createFork

```solidity
function createFork(string urlOrAlias, uint256 blockNumber) external nonpayable returns (uint256 forkId)
```

Creates a new fork with the given endpoint and block and returns the identifier of the fork.



#### Parameters

| Name | Type | Description |
|---|---|---|
| urlOrAlias | string | undefined |
| blockNumber | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| forkId | uint256 | undefined |

### createFork

```solidity
function createFork(string urlOrAlias, bytes32 txHash) external nonpayable returns (uint256 forkId)
```

Creates a new fork with the given endpoint and at the block the given transaction was mined in, replays all transaction mined in the block before the transaction, and returns the identifier of the fork.



#### Parameters

| Name | Type | Description |
|---|---|---|
| urlOrAlias | string | undefined |
| txHash | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| forkId | uint256 | undefined |

### createSelectFork

```solidity
function createSelectFork(string urlOrAlias, uint256 blockNumber) external nonpayable returns (uint256 forkId)
```

Creates and also selects a new fork with the given endpoint and block and returns the identifier of the fork.



#### Parameters

| Name | Type | Description |
|---|---|---|
| urlOrAlias | string | undefined |
| blockNumber | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| forkId | uint256 | undefined |

### createSelectFork

```solidity
function createSelectFork(string urlOrAlias, bytes32 txHash) external nonpayable returns (uint256 forkId)
```

Creates and also selects new fork with the given endpoint and at the block the given transaction was mined in, replays all transaction mined in the block before the transaction, returns the identifier of the fork.



#### Parameters

| Name | Type | Description |
|---|---|---|
| urlOrAlias | string | undefined |
| txHash | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| forkId | uint256 | undefined |

### createSelectFork

```solidity
function createSelectFork(string urlOrAlias) external nonpayable returns (uint256 forkId)
```

Creates and also selects a new fork with the given endpoint and the latest block and returns the identifier of the fork.



#### Parameters

| Name | Type | Description |
|---|---|---|
| urlOrAlias | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| forkId | uint256 | undefined |

### createWallet

```solidity
function createWallet(string walletLabel) external nonpayable returns (struct VmSafe.Wallet wallet)
```

Derives a private key from the name, labels the account with that name, and returns the wallet.



#### Parameters

| Name | Type | Description |
|---|---|---|
| walletLabel | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| wallet | VmSafe.Wallet | undefined |

### createWallet

```solidity
function createWallet(uint256 privateKey) external nonpayable returns (struct VmSafe.Wallet wallet)
```

Generates a wallet from the private key and returns the wallet.



#### Parameters

| Name | Type | Description |
|---|---|---|
| privateKey | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| wallet | VmSafe.Wallet | undefined |

### createWallet

```solidity
function createWallet(uint256 privateKey, string walletLabel) external nonpayable returns (struct VmSafe.Wallet wallet)
```

Generates a wallet from the private key, labels the account with that name, and returns the wallet.



#### Parameters

| Name | Type | Description |
|---|---|---|
| privateKey | uint256 | undefined |
| walletLabel | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| wallet | VmSafe.Wallet | undefined |

### deal

```solidity
function deal(address account, uint256 newBalance) external nonpayable
```

Sets an address&#39; balance.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| newBalance | uint256 | undefined |

### deleteSnapshot

```solidity
function deleteSnapshot(uint256 snapshotId) external nonpayable returns (bool success)
```

Removes the snapshot with the given ID created by `snapshot`. Takes the snapshot ID to delete. Returns `true` if the snapshot was successfully deleted. Returns `false` if the snapshot does not exist.



#### Parameters

| Name | Type | Description |
|---|---|---|
| snapshotId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| success | bool | undefined |

### deleteSnapshots

```solidity
function deleteSnapshots() external nonpayable
```

Removes _all_ snapshots previously created by `snapshot`.




### deriveKey

```solidity
function deriveKey(string mnemonic, string derivationPath, uint32 index, string language) external pure returns (uint256 privateKey)
```

Derive a private key from a provided mnenomic string (or mnenomic file path) in the specified language at `{derivationPath}{index}`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| mnemonic | string | undefined |
| derivationPath | string | undefined |
| index | uint32 | undefined |
| language | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| privateKey | uint256 | undefined |

### deriveKey

```solidity
function deriveKey(string mnemonic, uint32 index, string language) external pure returns (uint256 privateKey)
```

Derive a private key from a provided mnenomic string (or mnenomic file path) in the specified language at the derivation path `m/44&#39;/60&#39;/0&#39;/0/{index}`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| mnemonic | string | undefined |
| index | uint32 | undefined |
| language | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| privateKey | uint256 | undefined |

### deriveKey

```solidity
function deriveKey(string mnemonic, uint32 index) external pure returns (uint256 privateKey)
```

Derive a private key from a provided mnenomic string (or mnenomic file path) at the derivation path `m/44&#39;/60&#39;/0&#39;/0/{index}`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| mnemonic | string | undefined |
| index | uint32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| privateKey | uint256 | undefined |

### deriveKey

```solidity
function deriveKey(string mnemonic, string derivationPath, uint32 index) external pure returns (uint256 privateKey)
```

Derive a private key from a provided mnenomic string (or mnenomic file path) at `{derivationPath}{index}`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| mnemonic | string | undefined |
| derivationPath | string | undefined |
| index | uint32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| privateKey | uint256 | undefined |

### difficulty

```solidity
function difficulty(uint256 newDifficulty) external nonpayable
```

Sets `block.difficulty`. Not available on EVM versions from Paris onwards. Use `prevrandao` instead. Reverts if used on unsupported EVM versions.



#### Parameters

| Name | Type | Description |
|---|---|---|
| newDifficulty | uint256 | undefined |

### dumpState

```solidity
function dumpState(string pathToStateJson) external nonpayable
```

Dump a genesis JSON file&#39;s `allocs` to disk.



#### Parameters

| Name | Type | Description |
|---|---|---|
| pathToStateJson | string | undefined |

### envAddress

```solidity
function envAddress(string name) external view returns (address value)
```

Gets the environment variable `name` and parses it as `address`. Reverts if the variable was not found or could not be parsed.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | address | undefined |

### envAddress

```solidity
function envAddress(string name, string delim) external view returns (address[] value)
```

Gets the environment variable `name` and parses it as an array of `address`, delimited by `delim`. Reverts if the variable was not found or could not be parsed.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| delim | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | address[] | undefined |

### envBool

```solidity
function envBool(string name) external view returns (bool value)
```

Gets the environment variable `name` and parses it as `bool`. Reverts if the variable was not found or could not be parsed.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | bool | undefined |

### envBool

```solidity
function envBool(string name, string delim) external view returns (bool[] value)
```

Gets the environment variable `name` and parses it as an array of `bool`, delimited by `delim`. Reverts if the variable was not found or could not be parsed.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| delim | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | bool[] | undefined |

### envBytes

```solidity
function envBytes(string name) external view returns (bytes value)
```

Gets the environment variable `name` and parses it as `bytes`. Reverts if the variable was not found or could not be parsed.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | bytes | undefined |

### envBytes

```solidity
function envBytes(string name, string delim) external view returns (bytes[] value)
```

Gets the environment variable `name` and parses it as an array of `bytes`, delimited by `delim`. Reverts if the variable was not found or could not be parsed.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| delim | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | bytes[] | undefined |

### envBytes32

```solidity
function envBytes32(string name, string delim) external view returns (bytes32[] value)
```

Gets the environment variable `name` and parses it as an array of `bytes32`, delimited by `delim`. Reverts if the variable was not found or could not be parsed.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| delim | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | bytes32[] | undefined |

### envBytes32

```solidity
function envBytes32(string name) external view returns (bytes32 value)
```

Gets the environment variable `name` and parses it as `bytes32`. Reverts if the variable was not found or could not be parsed.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | bytes32 | undefined |

### envInt

```solidity
function envInt(string name, string delim) external view returns (int256[] value)
```

Gets the environment variable `name` and parses it as an array of `int256`, delimited by `delim`. Reverts if the variable was not found or could not be parsed.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| delim | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | int256[] | undefined |

### envInt

```solidity
function envInt(string name) external view returns (int256 value)
```

Gets the environment variable `name` and parses it as `int256`. Reverts if the variable was not found or could not be parsed.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | int256 | undefined |

### envOr

```solidity
function envOr(string name, string delim, bytes32[] defaultValue) external view returns (bytes32[] value)
```

Gets the environment variable `name` and parses it as an array of `bytes32`, delimited by `delim`. Reverts if the variable could not be parsed. Returns `defaultValue` if the variable was not found.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| delim | string | undefined |
| defaultValue | bytes32[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | bytes32[] | undefined |

### envOr

```solidity
function envOr(string name, string delim, int256[] defaultValue) external view returns (int256[] value)
```

Gets the environment variable `name` and parses it as an array of `int256`, delimited by `delim`. Reverts if the variable could not be parsed. Returns `defaultValue` if the variable was not found.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| delim | string | undefined |
| defaultValue | int256[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | int256[] | undefined |

### envOr

```solidity
function envOr(string name, bool defaultValue) external view returns (bool value)
```

Gets the environment variable `name` and parses it as `bool`. Reverts if the variable could not be parsed. Returns `defaultValue` if the variable was not found.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| defaultValue | bool | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | bool | undefined |

### envOr

```solidity
function envOr(string name, address defaultValue) external view returns (address value)
```

Gets the environment variable `name` and parses it as `address`. Reverts if the variable could not be parsed. Returns `defaultValue` if the variable was not found.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| defaultValue | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | address | undefined |

### envOr

```solidity
function envOr(string name, uint256 defaultValue) external view returns (uint256 value)
```

Gets the environment variable `name` and parses it as `uint256`. Reverts if the variable could not be parsed. Returns `defaultValue` if the variable was not found.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| defaultValue | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | uint256 | undefined |

### envOr

```solidity
function envOr(string name, string delim, bytes[] defaultValue) external view returns (bytes[] value)
```

Gets the environment variable `name` and parses it as an array of `bytes`, delimited by `delim`. Reverts if the variable could not be parsed. Returns `defaultValue` if the variable was not found.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| delim | string | undefined |
| defaultValue | bytes[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | bytes[] | undefined |

### envOr

```solidity
function envOr(string name, string delim, uint256[] defaultValue) external view returns (uint256[] value)
```

Gets the environment variable `name` and parses it as an array of `uint256`, delimited by `delim`. Reverts if the variable could not be parsed. Returns `defaultValue` if the variable was not found.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| delim | string | undefined |
| defaultValue | uint256[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | uint256[] | undefined |

### envOr

```solidity
function envOr(string name, string delim, string[] defaultValue) external view returns (string[] value)
```

Gets the environment variable `name` and parses it as an array of `string`, delimited by `delim`. Reverts if the variable could not be parsed. Returns `defaultValue` if the variable was not found.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| delim | string | undefined |
| defaultValue | string[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | string[] | undefined |

### envOr

```solidity
function envOr(string name, bytes defaultValue) external view returns (bytes value)
```

Gets the environment variable `name` and parses it as `bytes`. Reverts if the variable could not be parsed. Returns `defaultValue` if the variable was not found.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| defaultValue | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | bytes | undefined |

### envOr

```solidity
function envOr(string name, bytes32 defaultValue) external view returns (bytes32 value)
```

Gets the environment variable `name` and parses it as `bytes32`. Reverts if the variable could not be parsed. Returns `defaultValue` if the variable was not found.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| defaultValue | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | bytes32 | undefined |

### envOr

```solidity
function envOr(string name, int256 defaultValue) external view returns (int256 value)
```

Gets the environment variable `name` and parses it as `int256`. Reverts if the variable could not be parsed. Returns `defaultValue` if the variable was not found.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| defaultValue | int256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | int256 | undefined |

### envOr

```solidity
function envOr(string name, string delim, address[] defaultValue) external view returns (address[] value)
```

Gets the environment variable `name` and parses it as an array of `address`, delimited by `delim`. Reverts if the variable could not be parsed. Returns `defaultValue` if the variable was not found.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| delim | string | undefined |
| defaultValue | address[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | address[] | undefined |

### envOr

```solidity
function envOr(string name, string defaultValue) external view returns (string value)
```

Gets the environment variable `name` and parses it as `string`. Reverts if the variable could not be parsed. Returns `defaultValue` if the variable was not found.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| defaultValue | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | string | undefined |

### envOr

```solidity
function envOr(string name, string delim, bool[] defaultValue) external view returns (bool[] value)
```

Gets the environment variable `name` and parses it as an array of `bool`, delimited by `delim`. Reverts if the variable could not be parsed. Returns `defaultValue` if the variable was not found.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| delim | string | undefined |
| defaultValue | bool[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | bool[] | undefined |

### envString

```solidity
function envString(string name, string delim) external view returns (string[] value)
```

Gets the environment variable `name` and parses it as an array of `string`, delimited by `delim`. Reverts if the variable was not found or could not be parsed.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| delim | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | string[] | undefined |

### envString

```solidity
function envString(string name) external view returns (string value)
```

Gets the environment variable `name` and parses it as `string`. Reverts if the variable was not found or could not be parsed.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | string | undefined |

### envUint

```solidity
function envUint(string name) external view returns (uint256 value)
```

Gets the environment variable `name` and parses it as `uint256`. Reverts if the variable was not found or could not be parsed.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | uint256 | undefined |

### envUint

```solidity
function envUint(string name, string delim) external view returns (uint256[] value)
```

Gets the environment variable `name` and parses it as an array of `uint256`, delimited by `delim`. Reverts if the variable was not found or could not be parsed.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| delim | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | uint256[] | undefined |

### etch

```solidity
function etch(address target, bytes newRuntimeBytecode) external nonpayable
```

Sets an address&#39; code.



#### Parameters

| Name | Type | Description |
|---|---|---|
| target | address | undefined |
| newRuntimeBytecode | bytes | undefined |

### eth_getLogs

```solidity
function eth_getLogs(uint256 fromBlock, uint256 toBlock, address target, bytes32[] topics) external nonpayable returns (struct VmSafe.EthGetLogs[] logs)
```

Gets all the logs according to specified filter.



#### Parameters

| Name | Type | Description |
|---|---|---|
| fromBlock | uint256 | undefined |
| toBlock | uint256 | undefined |
| target | address | undefined |
| topics | bytes32[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| logs | VmSafe.EthGetLogs[] | undefined |

### exists

```solidity
function exists(string path) external nonpayable returns (bool result)
```

Returns true if the given path points to an existing entity, else returns false.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| result | bool | undefined |

### expectCall

```solidity
function expectCall(address callee, uint256 msgValue, uint64 gas, bytes data) external nonpayable
```

Expect a call to an address with the specified `msg.value`, gas, and calldata.



#### Parameters

| Name | Type | Description |
|---|---|---|
| callee | address | undefined |
| msgValue | uint256 | undefined |
| gas | uint64 | undefined |
| data | bytes | undefined |

### expectCall

```solidity
function expectCall(address callee, uint256 msgValue, uint64 gas, bytes data, uint64 count) external nonpayable
```

Expects given number of calls to an address with the specified `msg.value`, gas, and calldata.



#### Parameters

| Name | Type | Description |
|---|---|---|
| callee | address | undefined |
| msgValue | uint256 | undefined |
| gas | uint64 | undefined |
| data | bytes | undefined |
| count | uint64 | undefined |

### expectCall

```solidity
function expectCall(address callee, uint256 msgValue, bytes data, uint64 count) external nonpayable
```

Expects given number of calls to an address with the specified `msg.value` and calldata.



#### Parameters

| Name | Type | Description |
|---|---|---|
| callee | address | undefined |
| msgValue | uint256 | undefined |
| data | bytes | undefined |
| count | uint64 | undefined |

### expectCall

```solidity
function expectCall(address callee, bytes data) external nonpayable
```

Expects a call to an address with the specified calldata. Calldata can either be a strict or a partial match.



#### Parameters

| Name | Type | Description |
|---|---|---|
| callee | address | undefined |
| data | bytes | undefined |

### expectCall

```solidity
function expectCall(address callee, bytes data, uint64 count) external nonpayable
```

Expects given number of calls to an address with the specified calldata.



#### Parameters

| Name | Type | Description |
|---|---|---|
| callee | address | undefined |
| data | bytes | undefined |
| count | uint64 | undefined |

### expectCall

```solidity
function expectCall(address callee, uint256 msgValue, bytes data) external nonpayable
```

Expects a call to an address with the specified `msg.value` and calldata.



#### Parameters

| Name | Type | Description |
|---|---|---|
| callee | address | undefined |
| msgValue | uint256 | undefined |
| data | bytes | undefined |

### expectCallMinGas

```solidity
function expectCallMinGas(address callee, uint256 msgValue, uint64 minGas, bytes data) external nonpayable
```

Expect a call to an address with the specified `msg.value` and calldata, and a *minimum* amount of gas.



#### Parameters

| Name | Type | Description |
|---|---|---|
| callee | address | undefined |
| msgValue | uint256 | undefined |
| minGas | uint64 | undefined |
| data | bytes | undefined |

### expectCallMinGas

```solidity
function expectCallMinGas(address callee, uint256 msgValue, uint64 minGas, bytes data, uint64 count) external nonpayable
```

Expect given number of calls to an address with the specified `msg.value` and calldata, and a *minimum* amount of gas.



#### Parameters

| Name | Type | Description |
|---|---|---|
| callee | address | undefined |
| msgValue | uint256 | undefined |
| minGas | uint64 | undefined |
| data | bytes | undefined |
| count | uint64 | undefined |

### expectEmit

```solidity
function expectEmit() external nonpayable
```

Prepare an expected log with all topic and data checks enabled. Call this function, then emit an event, then call a function. Internally after the call, we check if logs were emitted in the expected order with the expected topics and data.




### expectEmit

```solidity
function expectEmit(bool checkTopic1, bool checkTopic2, bool checkTopic3, bool checkData) external nonpayable
```

Prepare an expected log with (bool checkTopic1, bool checkTopic2, bool checkTopic3, bool checkData.). Call this function, then emit an event, then call a function. Internally after the call, we check if logs were emitted in the expected order with the expected topics and data (as specified by the booleans).



#### Parameters

| Name | Type | Description |
|---|---|---|
| checkTopic1 | bool | undefined |
| checkTopic2 | bool | undefined |
| checkTopic3 | bool | undefined |
| checkData | bool | undefined |

### expectEmit

```solidity
function expectEmit(bool checkTopic1, bool checkTopic2, bool checkTopic3, bool checkData, address emitter) external nonpayable
```

Same as the previous method, but also checks supplied address against emitting contract.



#### Parameters

| Name | Type | Description |
|---|---|---|
| checkTopic1 | bool | undefined |
| checkTopic2 | bool | undefined |
| checkTopic3 | bool | undefined |
| checkData | bool | undefined |
| emitter | address | undefined |

### expectEmit

```solidity
function expectEmit(address emitter) external nonpayable
```

Same as the previous method, but also checks supplied address against emitting contract.



#### Parameters

| Name | Type | Description |
|---|---|---|
| emitter | address | undefined |

### expectRevert

```solidity
function expectRevert(bytes4 revertData) external nonpayable
```

Expects an error on next call that starts with the revert data.



#### Parameters

| Name | Type | Description |
|---|---|---|
| revertData | bytes4 | undefined |

### expectRevert

```solidity
function expectRevert(bytes revertData) external nonpayable
```

Expects an error on next call that exactly matches the revert data.



#### Parameters

| Name | Type | Description |
|---|---|---|
| revertData | bytes | undefined |

### expectRevert

```solidity
function expectRevert() external nonpayable
```

Expects an error on next call with any revert data.




### expectSafeMemory

```solidity
function expectSafeMemory(uint64 min, uint64 max) external nonpayable
```

Only allows memory writes to offsets [0x00, 0x60) ∪ [min, max) in the current subcontext. If any other memory is written to, the test will fail. Can be called multiple times to add more ranges to the set.



#### Parameters

| Name | Type | Description |
|---|---|---|
| min | uint64 | undefined |
| max | uint64 | undefined |

### expectSafeMemoryCall

```solidity
function expectSafeMemoryCall(uint64 min, uint64 max) external nonpayable
```

Only allows memory writes to offsets [0x00, 0x60) ∪ [min, max) in the next created subcontext. If any other memory is written to, the test will fail. Can be called multiple times to add more ranges to the set.



#### Parameters

| Name | Type | Description |
|---|---|---|
| min | uint64 | undefined |
| max | uint64 | undefined |

### fee

```solidity
function fee(uint256 newBasefee) external nonpayable
```

Sets `block.basefee`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| newBasefee | uint256 | undefined |

### ffi

```solidity
function ffi(string[] commandInput) external nonpayable returns (bytes result)
```

Performs a foreign function call via the terminal.



#### Parameters

| Name | Type | Description |
|---|---|---|
| commandInput | string[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| result | bytes | undefined |

### fsMetadata

```solidity
function fsMetadata(string path) external view returns (struct VmSafe.FsMetadata metadata)
```

Given a path, query the file system to get information about a file, directory, etc.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| metadata | VmSafe.FsMetadata | undefined |

### getBlockNumber

```solidity
function getBlockNumber() external view returns (uint256 height)
```

Gets the current `block.number`. You should use this instead of `block.number` if you use `vm.roll`, as `block.number` is assumed to be constant across a transaction, and as a result will get optimized out by the compiler. See https://github.com/foundry-rs/foundry/issues/6180




#### Returns

| Name | Type | Description |
|---|---|---|
| height | uint256 | undefined |

### getBlockTimestamp

```solidity
function getBlockTimestamp() external view returns (uint256 timestamp)
```

Gets the current `block.timestamp`. You should use this instead of `block.timestamp` if you use `vm.warp`, as `block.timestamp` is assumed to be constant across a transaction, and as a result will get optimized out by the compiler. See https://github.com/foundry-rs/foundry/issues/6180




#### Returns

| Name | Type | Description |
|---|---|---|
| timestamp | uint256 | undefined |

### getCode

```solidity
function getCode(string artifactPath) external view returns (bytes creationBytecode)
```

Gets the creation bytecode from an artifact file. Takes in the relative path to the json file.



#### Parameters

| Name | Type | Description |
|---|---|---|
| artifactPath | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| creationBytecode | bytes | undefined |

### getDeployedCode

```solidity
function getDeployedCode(string artifactPath) external view returns (bytes runtimeBytecode)
```

Gets the deployed bytecode from an artifact file. Takes in the relative path to the json file.



#### Parameters

| Name | Type | Description |
|---|---|---|
| artifactPath | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| runtimeBytecode | bytes | undefined |

### getLabel

```solidity
function getLabel(address account) external view returns (string currentLabel)
```

Gets the label for the specified address.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| currentLabel | string | undefined |

### getMappingKeyAndParentOf

```solidity
function getMappingKeyAndParentOf(address target, bytes32 elementSlot) external nonpayable returns (bool found, bytes32 key, bytes32 parent)
```

Gets the map key and parent of a mapping at a given slot, for a given address.



#### Parameters

| Name | Type | Description |
|---|---|---|
| target | address | undefined |
| elementSlot | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| found | bool | undefined |
| key | bytes32 | undefined |
| parent | bytes32 | undefined |

### getMappingLength

```solidity
function getMappingLength(address target, bytes32 mappingSlot) external nonpayable returns (uint256 length)
```

Gets the number of elements in the mapping at the given slot, for a given address.



#### Parameters

| Name | Type | Description |
|---|---|---|
| target | address | undefined |
| mappingSlot | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| length | uint256 | undefined |

### getMappingSlotAt

```solidity
function getMappingSlotAt(address target, bytes32 mappingSlot, uint256 idx) external nonpayable returns (bytes32 value)
```

Gets the elements at index idx of the mapping at the given slot, for a given address. The index must be less than the length of the mapping (i.e. the number of keys in the mapping).



#### Parameters

| Name | Type | Description |
|---|---|---|
| target | address | undefined |
| mappingSlot | bytes32 | undefined |
| idx | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| value | bytes32 | undefined |

### getNonce

```solidity
function getNonce(address account) external view returns (uint64 nonce)
```

Gets the nonce of an account.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| nonce | uint64 | undefined |

### getNonce

```solidity
function getNonce(VmSafe.Wallet wallet) external nonpayable returns (uint64 nonce)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| wallet | VmSafe.Wallet | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| nonce | uint64 | undefined |

### getRecordedLogs

```solidity
function getRecordedLogs() external nonpayable returns (struct VmSafe.Log[] logs)
```

Gets all the recorded logs.




#### Returns

| Name | Type | Description |
|---|---|---|
| logs | VmSafe.Log[] | undefined |

### isDir

```solidity
function isDir(string path) external nonpayable returns (bool result)
```

Returns true if the path exists on disk and is pointing at a directory, else returns false.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| result | bool | undefined |

### isFile

```solidity
function isFile(string path) external nonpayable returns (bool result)
```

Returns true if the path exists on disk and is pointing at a regular file, else returns false.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| result | bool | undefined |

### isPersistent

```solidity
function isPersistent(address account) external view returns (bool persistent)
```

Returns true if the account is marked as persistent.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| persistent | bool | undefined |

### keyExists

```solidity
function keyExists(string json, string key) external view returns (bool)
```

Checks if `key` exists in a JSON object `keyExists` is being deprecated in favor of `keyExistsJson`. It will be removed in future versions.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### keyExistsJson

```solidity
function keyExistsJson(string json, string key) external view returns (bool)
```

Checks if `key` exists in a JSON object.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### keyExistsToml

```solidity
function keyExistsToml(string toml, string key) external view returns (bool)
```

Checks if `key` exists in a TOML table.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### label

```solidity
function label(address account, string newLabel) external nonpayable
```

Labels an address in call traces.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| newLabel | string | undefined |

### load

```solidity
function load(address target, bytes32 slot) external view returns (bytes32 data)
```

Loads a storage slot from an address.



#### Parameters

| Name | Type | Description |
|---|---|---|
| target | address | undefined |
| slot | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| data | bytes32 | undefined |

### loadAllocs

```solidity
function loadAllocs(string pathToAllocsJson) external nonpayable
```

Load a genesis JSON file&#39;s `allocs` into the in-memory revm state.



#### Parameters

| Name | Type | Description |
|---|---|---|
| pathToAllocsJson | string | undefined |

### makePersistent

```solidity
function makePersistent(address[] accounts) external nonpayable
```

See `makePersistent(address)`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| accounts | address[] | undefined |

### makePersistent

```solidity
function makePersistent(address account0, address account1) external nonpayable
```

See `makePersistent(address)`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account0 | address | undefined |
| account1 | address | undefined |

### makePersistent

```solidity
function makePersistent(address account) external nonpayable
```

Marks that the account(s) should use persistent storage across fork swaps in a multifork setup Meaning, changes made to the state of this account will be kept when switching forks.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

### makePersistent

```solidity
function makePersistent(address account0, address account1, address account2) external nonpayable
```

See `makePersistent(address)`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account0 | address | undefined |
| account1 | address | undefined |
| account2 | address | undefined |

### mockCall

```solidity
function mockCall(address callee, uint256 msgValue, bytes data, bytes returnData) external nonpayable
```

Mocks a call to an address with a specific `msg.value`, returning specified data. Calldata match takes precedence over `msg.value` in case of ambiguity.



#### Parameters

| Name | Type | Description |
|---|---|---|
| callee | address | undefined |
| msgValue | uint256 | undefined |
| data | bytes | undefined |
| returnData | bytes | undefined |

### mockCall

```solidity
function mockCall(address callee, bytes data, bytes returnData) external nonpayable
```

Mocks a call to an address, returning specified data. Calldata can either be strict or a partial match, e.g. if you only pass a Solidity selector to the expected calldata, then the entire Solidity function will be mocked.



#### Parameters

| Name | Type | Description |
|---|---|---|
| callee | address | undefined |
| data | bytes | undefined |
| returnData | bytes | undefined |

### mockCallRevert

```solidity
function mockCallRevert(address callee, uint256 msgValue, bytes data, bytes revertData) external nonpayable
```

Reverts a call to an address with a specific `msg.value`, with specified revert data.



#### Parameters

| Name | Type | Description |
|---|---|---|
| callee | address | undefined |
| msgValue | uint256 | undefined |
| data | bytes | undefined |
| revertData | bytes | undefined |

### mockCallRevert

```solidity
function mockCallRevert(address callee, bytes data, bytes revertData) external nonpayable
```

Reverts a call to an address with specified revert data.



#### Parameters

| Name | Type | Description |
|---|---|---|
| callee | address | undefined |
| data | bytes | undefined |
| revertData | bytes | undefined |

### parseAddress

```solidity
function parseAddress(string stringifiedValue) external pure returns (address parsedValue)
```

Parses the given `string` into an `address`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| stringifiedValue | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| parsedValue | address | undefined |

### parseBool

```solidity
function parseBool(string stringifiedValue) external pure returns (bool parsedValue)
```

Parses the given `string` into a `bool`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| stringifiedValue | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| parsedValue | bool | undefined |

### parseBytes

```solidity
function parseBytes(string stringifiedValue) external pure returns (bytes parsedValue)
```

Parses the given `string` into `bytes`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| stringifiedValue | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| parsedValue | bytes | undefined |

### parseBytes32

```solidity
function parseBytes32(string stringifiedValue) external pure returns (bytes32 parsedValue)
```

Parses the given `string` into a `bytes32`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| stringifiedValue | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| parsedValue | bytes32 | undefined |

### parseInt

```solidity
function parseInt(string stringifiedValue) external pure returns (int256 parsedValue)
```

Parses the given `string` into a `int256`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| stringifiedValue | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| parsedValue | int256 | undefined |

### parseJson

```solidity
function parseJson(string json) external pure returns (bytes abiEncodedData)
```

ABI-encodes a JSON object.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| abiEncodedData | bytes | undefined |

### parseJson

```solidity
function parseJson(string json, string key) external pure returns (bytes abiEncodedData)
```

ABI-encodes a JSON object at `key`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| abiEncodedData | bytes | undefined |

### parseJsonAddress

```solidity
function parseJsonAddress(string json, string key) external pure returns (address)
```

Parses a string of JSON data at `key` and coerces it to `address`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### parseJsonAddressArray

```solidity
function parseJsonAddressArray(string json, string key) external pure returns (address[])
```

Parses a string of JSON data at `key` and coerces it to `address[]`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address[] | undefined |

### parseJsonBool

```solidity
function parseJsonBool(string json, string key) external pure returns (bool)
```

Parses a string of JSON data at `key` and coerces it to `bool`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### parseJsonBoolArray

```solidity
function parseJsonBoolArray(string json, string key) external pure returns (bool[])
```

Parses a string of JSON data at `key` and coerces it to `bool[]`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool[] | undefined |

### parseJsonBytes

```solidity
function parseJsonBytes(string json, string key) external pure returns (bytes)
```

Parses a string of JSON data at `key` and coerces it to `bytes`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes | undefined |

### parseJsonBytes32

```solidity
function parseJsonBytes32(string json, string key) external pure returns (bytes32)
```

Parses a string of JSON data at `key` and coerces it to `bytes32`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes32 | undefined |

### parseJsonBytes32Array

```solidity
function parseJsonBytes32Array(string json, string key) external pure returns (bytes32[])
```

Parses a string of JSON data at `key` and coerces it to `bytes32[]`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes32[] | undefined |

### parseJsonBytesArray

```solidity
function parseJsonBytesArray(string json, string key) external pure returns (bytes[])
```

Parses a string of JSON data at `key` and coerces it to `bytes[]`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes[] | undefined |

### parseJsonInt

```solidity
function parseJsonInt(string json, string key) external pure returns (int256)
```

Parses a string of JSON data at `key` and coerces it to `int256`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### parseJsonIntArray

```solidity
function parseJsonIntArray(string json, string key) external pure returns (int256[])
```

Parses a string of JSON data at `key` and coerces it to `int256[]`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256[] | undefined |

### parseJsonKeys

```solidity
function parseJsonKeys(string json, string key) external pure returns (string[] keys)
```

Returns an array of all the keys in a JSON object.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| keys | string[] | undefined |

### parseJsonString

```solidity
function parseJsonString(string json, string key) external pure returns (string)
```

Parses a string of JSON data at `key` and coerces it to `string`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### parseJsonStringArray

```solidity
function parseJsonStringArray(string json, string key) external pure returns (string[])
```

Parses a string of JSON data at `key` and coerces it to `string[]`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string[] | undefined |

### parseJsonUint

```solidity
function parseJsonUint(string json, string key) external pure returns (uint256)
```

Parses a string of JSON data at `key` and coerces it to `uint256`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### parseJsonUintArray

```solidity
function parseJsonUintArray(string json, string key) external pure returns (uint256[])
```

Parses a string of JSON data at `key` and coerces it to `uint256[]`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256[] | undefined |

### parseToml

```solidity
function parseToml(string toml, string key) external pure returns (bytes abiEncodedData)
```

ABI-encodes a TOML table at `key`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| abiEncodedData | bytes | undefined |

### parseToml

```solidity
function parseToml(string toml) external pure returns (bytes abiEncodedData)
```

ABI-encodes a TOML table.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| abiEncodedData | bytes | undefined |

### parseTomlAddress

```solidity
function parseTomlAddress(string toml, string key) external pure returns (address)
```

Parses a string of TOML data at `key` and coerces it to `address`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### parseTomlAddressArray

```solidity
function parseTomlAddressArray(string toml, string key) external pure returns (address[])
```

Parses a string of TOML data at `key` and coerces it to `address[]`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address[] | undefined |

### parseTomlBool

```solidity
function parseTomlBool(string toml, string key) external pure returns (bool)
```

Parses a string of TOML data at `key` and coerces it to `bool`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### parseTomlBoolArray

```solidity
function parseTomlBoolArray(string toml, string key) external pure returns (bool[])
```

Parses a string of TOML data at `key` and coerces it to `bool[]`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool[] | undefined |

### parseTomlBytes

```solidity
function parseTomlBytes(string toml, string key) external pure returns (bytes)
```

Parses a string of TOML data at `key` and coerces it to `bytes`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes | undefined |

### parseTomlBytes32

```solidity
function parseTomlBytes32(string toml, string key) external pure returns (bytes32)
```

Parses a string of TOML data at `key` and coerces it to `bytes32`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes32 | undefined |

### parseTomlBytes32Array

```solidity
function parseTomlBytes32Array(string toml, string key) external pure returns (bytes32[])
```

Parses a string of TOML data at `key` and coerces it to `bytes32[]`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes32[] | undefined |

### parseTomlBytesArray

```solidity
function parseTomlBytesArray(string toml, string key) external pure returns (bytes[])
```

Parses a string of TOML data at `key` and coerces it to `bytes[]`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes[] | undefined |

### parseTomlInt

```solidity
function parseTomlInt(string toml, string key) external pure returns (int256)
```

Parses a string of TOML data at `key` and coerces it to `int256`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### parseTomlIntArray

```solidity
function parseTomlIntArray(string toml, string key) external pure returns (int256[])
```

Parses a string of TOML data at `key` and coerces it to `int256[]`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256[] | undefined |

### parseTomlKeys

```solidity
function parseTomlKeys(string toml, string key) external pure returns (string[] keys)
```

Returns an array of all the keys in a TOML table.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| keys | string[] | undefined |

### parseTomlString

```solidity
function parseTomlString(string toml, string key) external pure returns (string)
```

Parses a string of TOML data at `key` and coerces it to `string`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### parseTomlStringArray

```solidity
function parseTomlStringArray(string toml, string key) external pure returns (string[])
```

Parses a string of TOML data at `key` and coerces it to `string[]`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string[] | undefined |

### parseTomlUint

```solidity
function parseTomlUint(string toml, string key) external pure returns (uint256)
```

Parses a string of TOML data at `key` and coerces it to `uint256`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### parseTomlUintArray

```solidity
function parseTomlUintArray(string toml, string key) external pure returns (uint256[])
```

Parses a string of TOML data at `key` and coerces it to `uint256[]`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| toml | string | undefined |
| key | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256[] | undefined |

### parseUint

```solidity
function parseUint(string stringifiedValue) external pure returns (uint256 parsedValue)
```

Parses the given `string` into a `uint256`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| stringifiedValue | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| parsedValue | uint256 | undefined |

### pauseGasMetering

```solidity
function pauseGasMetering() external nonpayable
```

Pauses gas metering (i.e. gas usage is not counted). Noop if already paused.




### prank

```solidity
function prank(address msgSender, address txOrigin) external nonpayable
```

Sets the *next* call&#39;s `msg.sender` to be the input address, and the `tx.origin` to be the second input.



#### Parameters

| Name | Type | Description |
|---|---|---|
| msgSender | address | undefined |
| txOrigin | address | undefined |

### prank

```solidity
function prank(address msgSender) external nonpayable
```

Sets the *next* call&#39;s `msg.sender` to be the input address.



#### Parameters

| Name | Type | Description |
|---|---|---|
| msgSender | address | undefined |

### prevrandao

```solidity
function prevrandao(bytes32 newPrevrandao) external nonpayable
```

Sets `block.prevrandao`. Not available on EVM versions before Paris. Use `difficulty` instead. If used on unsupported EVM versions it will revert.



#### Parameters

| Name | Type | Description |
|---|---|---|
| newPrevrandao | bytes32 | undefined |

### projectRoot

```solidity
function projectRoot() external view returns (string path)
```

Get the path of the current project root.




#### Returns

| Name | Type | Description |
|---|---|---|
| path | string | undefined |

### readCallers

```solidity
function readCallers() external nonpayable returns (enum VmSafe.CallerMode callerMode, address msgSender, address txOrigin)
```

Reads the current `msg.sender` and `tx.origin` from state and reports if there is any active caller modification.




#### Returns

| Name | Type | Description |
|---|---|---|
| callerMode | enum VmSafe.CallerMode | undefined |
| msgSender | address | undefined |
| txOrigin | address | undefined |

### readDir

```solidity
function readDir(string path, uint64 maxDepth) external view returns (struct VmSafe.DirEntry[] entries)
```

See `readDir(string)`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |
| maxDepth | uint64 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| entries | VmSafe.DirEntry[] | undefined |

### readDir

```solidity
function readDir(string path, uint64 maxDepth, bool followLinks) external view returns (struct VmSafe.DirEntry[] entries)
```

See `readDir(string)`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |
| maxDepth | uint64 | undefined |
| followLinks | bool | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| entries | VmSafe.DirEntry[] | undefined |

### readDir

```solidity
function readDir(string path) external view returns (struct VmSafe.DirEntry[] entries)
```

Reads the directory at the given path recursively, up to `maxDepth`. `maxDepth` defaults to 1, meaning only the direct children of the given directory will be returned. Follows symbolic links if `followLinks` is true.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| entries | VmSafe.DirEntry[] | undefined |

### readFile

```solidity
function readFile(string path) external view returns (string data)
```

Reads the entire content of file to string. `path` is relative to the project root.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| data | string | undefined |

### readFileBinary

```solidity
function readFileBinary(string path) external view returns (bytes data)
```

Reads the entire content of file as binary. `path` is relative to the project root.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| data | bytes | undefined |

### readLine

```solidity
function readLine(string path) external view returns (string line)
```

Reads next line of file to string.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| line | string | undefined |

### readLink

```solidity
function readLink(string linkPath) external view returns (string targetPath)
```

Reads a symbolic link, returning the path that the link points to. This cheatcode will revert in the following situations, but is not limited to just these cases: - `path` is not a symbolic link. - `path` does not exist.



#### Parameters

| Name | Type | Description |
|---|---|---|
| linkPath | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| targetPath | string | undefined |

### record

```solidity
function record() external nonpayable
```

Records all storage reads and writes.




### recordLogs

```solidity
function recordLogs() external nonpayable
```

Record all the transaction logs.




### rememberKey

```solidity
function rememberKey(uint256 privateKey) external nonpayable returns (address keyAddr)
```

Adds a private key to the local forge wallet and returns the address.



#### Parameters

| Name | Type | Description |
|---|---|---|
| privateKey | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| keyAddr | address | undefined |

### removeDir

```solidity
function removeDir(string path, bool recursive) external nonpayable
```

Removes a directory at the provided path. This cheatcode will revert in the following situations, but is not limited to just these cases: - `path` doesn&#39;t exist. - `path` isn&#39;t a directory. - User lacks permissions to modify `path`. - The directory is not empty and `recursive` is false. `path` is relative to the project root.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |
| recursive | bool | undefined |

### removeFile

```solidity
function removeFile(string path) external nonpayable
```

Removes a file from the filesystem. This cheatcode will revert in the following situations, but is not limited to just these cases: - `path` points to a directory. - The file doesn&#39;t exist. - The user lacks permissions to remove the file. `path` is relative to the project root.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |

### replace

```solidity
function replace(string input, string from, string to) external pure returns (string output)
```

Replaces occurrences of `from` in the given `string` with `to`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| input | string | undefined |
| from | string | undefined |
| to | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| output | string | undefined |

### resetNonce

```solidity
function resetNonce(address account) external nonpayable
```

Resets the nonce of an account to 0 for EOAs and 1 for contract accounts.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

### resumeGasMetering

```solidity
function resumeGasMetering() external nonpayable
```

Resumes gas metering (i.e. gas usage is counted again). Noop if already on.




### revertTo

```solidity
function revertTo(uint256 snapshotId) external nonpayable returns (bool success)
```

Revert the state of the EVM to a previous snapshot Takes the snapshot ID to revert to. Returns `true` if the snapshot was successfully reverted. Returns `false` if the snapshot does not exist. **Note:** This does not automatically delete the snapshot. To delete the snapshot use `deleteSnapshot`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| snapshotId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| success | bool | undefined |

### revertToAndDelete

```solidity
function revertToAndDelete(uint256 snapshotId) external nonpayable returns (bool success)
```

Revert the state of the EVM to a previous snapshot and automatically deletes the snapshots Takes the snapshot ID to revert to. Returns `true` if the snapshot was successfully reverted and deleted. Returns `false` if the snapshot does not exist.



#### Parameters

| Name | Type | Description |
|---|---|---|
| snapshotId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| success | bool | undefined |

### revokePersistent

```solidity
function revokePersistent(address[] accounts) external nonpayable
```

See `revokePersistent(address)`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| accounts | address[] | undefined |

### revokePersistent

```solidity
function revokePersistent(address account) external nonpayable
```

Revokes persistent status from the address, previously added via `makePersistent`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

### roll

```solidity
function roll(uint256 newHeight) external nonpayable
```

Sets `block.height`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| newHeight | uint256 | undefined |

### rollFork

```solidity
function rollFork(bytes32 txHash) external nonpayable
```

Updates the currently active fork to given transaction. This will `rollFork` with the number of the block the transaction was mined in and replays all transaction mined before it in the block.



#### Parameters

| Name | Type | Description |
|---|---|---|
| txHash | bytes32 | undefined |

### rollFork

```solidity
function rollFork(uint256 forkId, uint256 blockNumber) external nonpayable
```

Updates the given fork to given block number.



#### Parameters

| Name | Type | Description |
|---|---|---|
| forkId | uint256 | undefined |
| blockNumber | uint256 | undefined |

### rollFork

```solidity
function rollFork(uint256 blockNumber) external nonpayable
```

Updates the currently active fork to given block number This is similar to `roll` but for the currently active fork.



#### Parameters

| Name | Type | Description |
|---|---|---|
| blockNumber | uint256 | undefined |

### rollFork

```solidity
function rollFork(uint256 forkId, bytes32 txHash) external nonpayable
```

Updates the given fork to block number of the given transaction and replays all transaction mined before it in the block.



#### Parameters

| Name | Type | Description |
|---|---|---|
| forkId | uint256 | undefined |
| txHash | bytes32 | undefined |

### rpc

```solidity
function rpc(string method, string params) external nonpayable returns (bytes data)
```

Performs an Ethereum JSON-RPC request to the current fork URL.



#### Parameters

| Name | Type | Description |
|---|---|---|
| method | string | undefined |
| params | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| data | bytes | undefined |

### rpcUrl

```solidity
function rpcUrl(string rpcAlias) external view returns (string json)
```

Returns the RPC url for the given alias.



#### Parameters

| Name | Type | Description |
|---|---|---|
| rpcAlias | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

### rpcUrlStructs

```solidity
function rpcUrlStructs() external view returns (struct VmSafe.Rpc[] urls)
```

Returns all rpc urls and their aliases as structs.




#### Returns

| Name | Type | Description |
|---|---|---|
| urls | VmSafe.Rpc[] | undefined |

### rpcUrls

```solidity
function rpcUrls() external view returns (string[2][] urls)
```

Returns all rpc urls and their aliases `[alias, url][]`.




#### Returns

| Name | Type | Description |
|---|---|---|
| urls | string[2][] | undefined |

### selectFork

```solidity
function selectFork(uint256 forkId) external nonpayable
```

Takes a fork identifier created by `createFork` and sets the corresponding forked state as active.



#### Parameters

| Name | Type | Description |
|---|---|---|
| forkId | uint256 | undefined |

### serializeAddress

```solidity
function serializeAddress(string objectKey, string valueKey, address[] values) external nonpayable returns (string json)
```

See `serializeJson`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| objectKey | string | undefined |
| valueKey | string | undefined |
| values | address[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

### serializeAddress

```solidity
function serializeAddress(string objectKey, string valueKey, address value) external nonpayable returns (string json)
```

See `serializeJson`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| objectKey | string | undefined |
| valueKey | string | undefined |
| value | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

### serializeBool

```solidity
function serializeBool(string objectKey, string valueKey, bool[] values) external nonpayable returns (string json)
```

See `serializeJson`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| objectKey | string | undefined |
| valueKey | string | undefined |
| values | bool[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

### serializeBool

```solidity
function serializeBool(string objectKey, string valueKey, bool value) external nonpayable returns (string json)
```

See `serializeJson`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| objectKey | string | undefined |
| valueKey | string | undefined |
| value | bool | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

### serializeBytes

```solidity
function serializeBytes(string objectKey, string valueKey, bytes[] values) external nonpayable returns (string json)
```

See `serializeJson`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| objectKey | string | undefined |
| valueKey | string | undefined |
| values | bytes[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

### serializeBytes

```solidity
function serializeBytes(string objectKey, string valueKey, bytes value) external nonpayable returns (string json)
```

See `serializeJson`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| objectKey | string | undefined |
| valueKey | string | undefined |
| value | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

### serializeBytes32

```solidity
function serializeBytes32(string objectKey, string valueKey, bytes32[] values) external nonpayable returns (string json)
```

See `serializeJson`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| objectKey | string | undefined |
| valueKey | string | undefined |
| values | bytes32[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

### serializeBytes32

```solidity
function serializeBytes32(string objectKey, string valueKey, bytes32 value) external nonpayable returns (string json)
```

See `serializeJson`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| objectKey | string | undefined |
| valueKey | string | undefined |
| value | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

### serializeInt

```solidity
function serializeInt(string objectKey, string valueKey, int256 value) external nonpayable returns (string json)
```

See `serializeJson`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| objectKey | string | undefined |
| valueKey | string | undefined |
| value | int256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

### serializeInt

```solidity
function serializeInt(string objectKey, string valueKey, int256[] values) external nonpayable returns (string json)
```

See `serializeJson`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| objectKey | string | undefined |
| valueKey | string | undefined |
| values | int256[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

### serializeJson

```solidity
function serializeJson(string objectKey, string value) external nonpayable returns (string json)
```

Serializes a key and value to a JSON object stored in-memory that can be later written to a file. Returns the stringified version of the specific JSON file up to that moment.



#### Parameters

| Name | Type | Description |
|---|---|---|
| objectKey | string | undefined |
| value | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

### serializeString

```solidity
function serializeString(string objectKey, string valueKey, string[] values) external nonpayable returns (string json)
```

See `serializeJson`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| objectKey | string | undefined |
| valueKey | string | undefined |
| values | string[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

### serializeString

```solidity
function serializeString(string objectKey, string valueKey, string value) external nonpayable returns (string json)
```

See `serializeJson`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| objectKey | string | undefined |
| valueKey | string | undefined |
| value | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

### serializeUint

```solidity
function serializeUint(string objectKey, string valueKey, uint256 value) external nonpayable returns (string json)
```

See `serializeJson`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| objectKey | string | undefined |
| valueKey | string | undefined |
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

### serializeUint

```solidity
function serializeUint(string objectKey, string valueKey, uint256[] values) external nonpayable returns (string json)
```

See `serializeJson`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| objectKey | string | undefined |
| valueKey | string | undefined |
| values | uint256[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| json | string | undefined |

### setEnv

```solidity
function setEnv(string name, string value) external nonpayable
```

Sets environment variables.



#### Parameters

| Name | Type | Description |
|---|---|---|
| name | string | undefined |
| value | string | undefined |

### setNonce

```solidity
function setNonce(address account, uint64 newNonce) external nonpayable
```

Sets the nonce of an account. Must be higher than the current nonce of the account.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| newNonce | uint64 | undefined |

### setNonceUnsafe

```solidity
function setNonceUnsafe(address account, uint64 newNonce) external nonpayable
```

Sets the nonce of an account to an arbitrary value.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| newNonce | uint64 | undefined |

### sign

```solidity
function sign(VmSafe.Wallet wallet, bytes32 digest) external nonpayable returns (uint8 v, bytes32 r, bytes32 s)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| wallet | VmSafe.Wallet | undefined |
| digest | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| v | uint8 | undefined |
| r | bytes32 | undefined |
| s | bytes32 | undefined |

### sign

```solidity
function sign(uint256 privateKey, bytes32 digest) external pure returns (uint8 v, bytes32 r, bytes32 s)
```

Signs `digest` with `privateKey` using the secp256k1 curve.



#### Parameters

| Name | Type | Description |
|---|---|---|
| privateKey | uint256 | undefined |
| digest | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| v | uint8 | undefined |
| r | bytes32 | undefined |
| s | bytes32 | undefined |

### signP256

```solidity
function signP256(uint256 privateKey, bytes32 digest) external pure returns (bytes32 r, bytes32 s)
```

Signs `digest` with `privateKey` using the secp256r1 curve.



#### Parameters

| Name | Type | Description |
|---|---|---|
| privateKey | uint256 | undefined |
| digest | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| r | bytes32 | undefined |
| s | bytes32 | undefined |

### skip

```solidity
function skip(bool skipTest) external nonpayable
```

Marks a test as skipped. Must be called at the top of the test.



#### Parameters

| Name | Type | Description |
|---|---|---|
| skipTest | bool | undefined |

### sleep

```solidity
function sleep(uint256 duration) external nonpayable
```

Suspends execution of the main thread for `duration` milliseconds.



#### Parameters

| Name | Type | Description |
|---|---|---|
| duration | uint256 | undefined |

### snapshot

```solidity
function snapshot() external nonpayable returns (uint256 snapshotId)
```

Snapshot the current state of the evm. Returns the ID of the snapshot that was created. To revert a snapshot use `revertTo`.




#### Returns

| Name | Type | Description |
|---|---|---|
| snapshotId | uint256 | undefined |

### split

```solidity
function split(string input, string delimiter) external pure returns (string[] outputs)
```

Splits the given `string` into an array of strings divided by the `delimiter`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| input | string | undefined |
| delimiter | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| outputs | string[] | undefined |

### startBroadcast

```solidity
function startBroadcast() external nonpayable
```

Using the address that calls the test contract, has all subsequent calls (at this call depth only) create transactions that can later be signed and sent onchain.




### startBroadcast

```solidity
function startBroadcast(address signer) external nonpayable
```

Has all subsequent calls (at this call depth only) create transactions with the address provided that can later be signed and sent onchain.



#### Parameters

| Name | Type | Description |
|---|---|---|
| signer | address | undefined |

### startBroadcast

```solidity
function startBroadcast(uint256 privateKey) external nonpayable
```

Has all subsequent calls (at this call depth only) create transactions with the private key provided that can later be signed and sent onchain.



#### Parameters

| Name | Type | Description |
|---|---|---|
| privateKey | uint256 | undefined |

### startMappingRecording

```solidity
function startMappingRecording() external nonpayable
```

Starts recording all map SSTOREs for later retrieval.




### startPrank

```solidity
function startPrank(address msgSender) external nonpayable
```

Sets all subsequent calls&#39; `msg.sender` to be the input address until `stopPrank` is called.



#### Parameters

| Name | Type | Description |
|---|---|---|
| msgSender | address | undefined |

### startPrank

```solidity
function startPrank(address msgSender, address txOrigin) external nonpayable
```

Sets all subsequent calls&#39; `msg.sender` to be the input address until `stopPrank` is called, and the `tx.origin` to be the second input.



#### Parameters

| Name | Type | Description |
|---|---|---|
| msgSender | address | undefined |
| txOrigin | address | undefined |

### startStateDiffRecording

```solidity
function startStateDiffRecording() external nonpayable
```

Record all account accesses as part of CREATE, CALL or SELFDESTRUCT opcodes in order, along with the context of the calls




### stopAndReturnStateDiff

```solidity
function stopAndReturnStateDiff() external nonpayable returns (struct VmSafe.AccountAccess[] accountAccesses)
```

Returns an ordered array of all account accesses from a `vm.startStateDiffRecording` session.




#### Returns

| Name | Type | Description |
|---|---|---|
| accountAccesses | VmSafe.AccountAccess[] | undefined |

### stopBroadcast

```solidity
function stopBroadcast() external nonpayable
```

Stops collecting onchain transactions.




### stopExpectSafeMemory

```solidity
function stopExpectSafeMemory() external nonpayable
```

Stops all safe memory expectation in the current subcontext.




### stopMappingRecording

```solidity
function stopMappingRecording() external nonpayable
```

Stops recording all map SSTOREs for later retrieval and clears the recorded data.




### stopPrank

```solidity
function stopPrank() external nonpayable
```

Resets subsequent calls&#39; `msg.sender` to be `address(this)`.




### store

```solidity
function store(address target, bytes32 slot, bytes32 value) external nonpayable
```

Stores a value to an address&#39; storage slot.



#### Parameters

| Name | Type | Description |
|---|---|---|
| target | address | undefined |
| slot | bytes32 | undefined |
| value | bytes32 | undefined |

### toBase64

```solidity
function toBase64(string data) external pure returns (string)
```

Encodes a `string` value to a base64 string.



#### Parameters

| Name | Type | Description |
|---|---|---|
| data | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### toBase64

```solidity
function toBase64(bytes data) external pure returns (string)
```

Encodes a `bytes` value to a base64 string.



#### Parameters

| Name | Type | Description |
|---|---|---|
| data | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### toBase64URL

```solidity
function toBase64URL(string data) external pure returns (string)
```

Encodes a `string` value to a base64url string.



#### Parameters

| Name | Type | Description |
|---|---|---|
| data | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### toBase64URL

```solidity
function toBase64URL(bytes data) external pure returns (string)
```

Encodes a `bytes` value to a base64url string.



#### Parameters

| Name | Type | Description |
|---|---|---|
| data | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### toLowercase

```solidity
function toLowercase(string input) external pure returns (string output)
```

Converts the given `string` value to Lowercase.



#### Parameters

| Name | Type | Description |
|---|---|---|
| input | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| output | string | undefined |

### toString

```solidity
function toString(address value) external pure returns (string stringifiedValue)
```

Converts the given value to a `string`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| value | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| stringifiedValue | string | undefined |

### toString

```solidity
function toString(uint256 value) external pure returns (string stringifiedValue)
```

Converts the given value to a `string`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| stringifiedValue | string | undefined |

### toString

```solidity
function toString(bytes value) external pure returns (string stringifiedValue)
```

Converts the given value to a `string`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| value | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| stringifiedValue | string | undefined |

### toString

```solidity
function toString(bool value) external pure returns (string stringifiedValue)
```

Converts the given value to a `string`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| value | bool | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| stringifiedValue | string | undefined |

### toString

```solidity
function toString(int256 value) external pure returns (string stringifiedValue)
```

Converts the given value to a `string`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| value | int256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| stringifiedValue | string | undefined |

### toString

```solidity
function toString(bytes32 value) external pure returns (string stringifiedValue)
```

Converts the given value to a `string`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| value | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| stringifiedValue | string | undefined |

### toUppercase

```solidity
function toUppercase(string input) external pure returns (string output)
```

Converts the given `string` value to Uppercase.



#### Parameters

| Name | Type | Description |
|---|---|---|
| input | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| output | string | undefined |

### transact

```solidity
function transact(uint256 forkId, bytes32 txHash) external nonpayable
```

Fetches the given transaction from the given fork and executes it on the current state.



#### Parameters

| Name | Type | Description |
|---|---|---|
| forkId | uint256 | undefined |
| txHash | bytes32 | undefined |

### transact

```solidity
function transact(bytes32 txHash) external nonpayable
```

Fetches the given transaction from the active fork and executes it on the current state.



#### Parameters

| Name | Type | Description |
|---|---|---|
| txHash | bytes32 | undefined |

### trim

```solidity
function trim(string input) external pure returns (string output)
```

Trims leading and trailing whitespace from the given `string` value.



#### Parameters

| Name | Type | Description |
|---|---|---|
| input | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| output | string | undefined |

### tryFfi

```solidity
function tryFfi(string[] commandInput) external nonpayable returns (struct VmSafe.FfiResult result)
```

Performs a foreign function call via terminal and returns the exit code, stdout, and stderr.



#### Parameters

| Name | Type | Description |
|---|---|---|
| commandInput | string[] | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| result | VmSafe.FfiResult | undefined |

### txGasPrice

```solidity
function txGasPrice(uint256 newGasPrice) external nonpayable
```

Sets `tx.gasprice`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| newGasPrice | uint256 | undefined |

### unixTime

```solidity
function unixTime() external nonpayable returns (uint256 milliseconds)
```

Returns the time since unix epoch in milliseconds.




#### Returns

| Name | Type | Description |
|---|---|---|
| milliseconds | uint256 | undefined |

### warp

```solidity
function warp(uint256 newTimestamp) external nonpayable
```

Sets `block.timestamp`.



#### Parameters

| Name | Type | Description |
|---|---|---|
| newTimestamp | uint256 | undefined |

### writeFile

```solidity
function writeFile(string path, string data) external nonpayable
```

Writes data to file, creating a file if it does not exist, and entirely replacing its contents if it does. `path` is relative to the project root.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |
| data | string | undefined |

### writeFileBinary

```solidity
function writeFileBinary(string path, bytes data) external nonpayable
```

Writes binary data to a file, creating a file if it does not exist, and entirely replacing its contents if it does. `path` is relative to the project root.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |
| data | bytes | undefined |

### writeJson

```solidity
function writeJson(string json, string path, string valueKey) external nonpayable
```

Write a serialized JSON object to an **existing** JSON file, replacing a value with key = &lt;value_key.&gt; This is useful to replace a specific value of a JSON file, without having to parse the entire thing.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| path | string | undefined |
| valueKey | string | undefined |

### writeJson

```solidity
function writeJson(string json, string path) external nonpayable
```

Write a serialized JSON object to a file. If the file exists, it will be overwritten.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| path | string | undefined |

### writeLine

```solidity
function writeLine(string path, string data) external nonpayable
```

Writes line to file, creating a file if it does not exist. `path` is relative to the project root.



#### Parameters

| Name | Type | Description |
|---|---|---|
| path | string | undefined |
| data | string | undefined |

### writeToml

```solidity
function writeToml(string json, string path, string valueKey) external nonpayable
```

Takes serialized JSON, converts to TOML and write a serialized TOML table to an **existing** TOML file, replacing a value with key = &lt;value_key.&gt; This is useful to replace a specific value of a TOML file, without having to parse the entire thing.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| path | string | undefined |
| valueKey | string | undefined |

### writeToml

```solidity
function writeToml(string json, string path) external nonpayable
```

Takes serialized JSON, converts to TOML and write a serialized TOML to a file.



#### Parameters

| Name | Type | Description |
|---|---|---|
| json | string | undefined |
| path | string | undefined |




