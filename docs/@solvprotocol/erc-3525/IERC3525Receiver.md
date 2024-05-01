# IERC3525Receiver



> EIP-3525 token receiver interface



*Interface for a smart contract that wants to be informed by EIP-3525 contracts when   receiving values from ANY addresses or EIP-3525 tokens. Note: the EIP-165 identifier for this interface is 0x009ce20b.*

## Methods

### onERC3525Received

```solidity
function onERC3525Received(address _operator, uint256 _fromTokenId, uint256 _toTokenId, uint256 _value, bytes _data) external nonpayable returns (bytes4)
```

Handle the receipt of an EIP-3525 token value.

*An EIP-3525 smart contract MUST check whether this function is implemented by the   recipient contract, if the recipient contract implements this function, the EIP-3525   contract MUST call this function after a value transfer (i.e. `transferFrom(uint256,  uint256,uint256,bytes)`).  MUST return 0x009ce20b (i.e. `bytes4(keccak256(&#39;onERC3525Received(address,uint256,uint256,  uint256,bytes)&#39;))`) if the transfer is accepted.  MUST revert or return any value other than 0x009ce20b if the transfer is rejected.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _operator | address | The address which triggered the transfer |
| _fromTokenId | uint256 | The token id to transfer value from |
| _toTokenId | uint256 | The token id to transfer value to |
| _value | uint256 | The transferred value |
| _data | bytes | Additional data with no specified format |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes4 | `bytes4(keccak256(&#39;onERC3525Received(address,uint256,uint256,uint256,bytes)&#39;))`   unless the transfer is rejected. |




