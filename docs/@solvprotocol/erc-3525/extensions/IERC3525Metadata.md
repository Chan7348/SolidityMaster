# IERC3525Metadata



> ERC-3525 Semi-Fungible Token Standard, optional extension for metadata



*Interfaces for any contract that wants to support query of the Uniform Resource Identifier  (URI) for the ERC3525 contract as well as a specified slot.  Because of the higher reliability of data stored in smart contracts compared to data stored in  centralized systems, it is recommended that metadata, including `contractURI`, `slotURI` and  `tokenURI`, be directly returned in JSON format, instead of being returned with a url pointing  to any resource stored in a centralized system.  See https://eips.ethereum.org/EIPS/eip-3525 Note: the ERC-165 identifier for this interface is 0xe1600902.*

## Methods

### allowance

```solidity
function allowance(uint256 _tokenId, address _operator) external view returns (uint256)
```

Get the maximum value of a token that an operator is allowed to manage.



#### Parameters

| Name | Type | Description |
|---|---|---|
| _tokenId | uint256 | The token for which to query the allowance |
| _operator | address | The address of an operator |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | The current approval value of `_tokenId` that `_operator` is allowed to manage |

### approve

```solidity
function approve(address _approved, uint256 _tokenId) external payable
```

Change or reaffirm the approved address for an NFT

*The zero address indicates there is no approved address.  Throws unless `msg.sender` is the current NFT owner, or an authorized  operator of the current owner.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _approved | address | The new approved NFT controller |
| _tokenId | uint256 | The NFT to approve |

### approve

```solidity
function approve(uint256 _tokenId, address _operator, uint256 _value) external payable
```

Allow an operator to manage the value of a token, up to the `_value` amount.

*MUST revert unless caller is the current owner, an authorized operator, or the approved  address for `_tokenId`.  MUST emit ApprovalValue event.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _tokenId | uint256 | The token to approve |
| _operator | address | The operator to be approved |
| _value | uint256 | The maximum value of `_toTokenId` that `_operator` is allowed to manage |

### balanceOf

```solidity
function balanceOf(address _owner) external view returns (uint256)
```

Count all NFTs assigned to an owner

*NFTs assigned to the zero address are considered invalid, and this  function throws for queries about the zero address.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _owner | address | An address for whom to query the balance |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | The number of NFTs owned by `_owner`, possibly zero |

### balanceOf

```solidity
function balanceOf(uint256 _tokenId) external view returns (uint256)
```

Get the value of a token.



#### Parameters

| Name | Type | Description |
|---|---|---|
| _tokenId | uint256 | The token for which to query the balance |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | The value of `_tokenId` |

### contractURI

```solidity
function contractURI() external view returns (string)
```

Returns the Uniform Resource Identifier (URI) for the current ERC3525 contract.

*This function SHOULD return the URI for this contract in JSON format, starting with  header `data:application/json;`.  See https://eips.ethereum.org/EIPS/eip-3525 for the JSON schema for contract URI.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | The JSON formatted URI of the current ERC3525 contract |

### getApproved

```solidity
function getApproved(uint256 _tokenId) external view returns (address)
```

Get the approved address for a single NFT

*Throws if `_tokenId` is not a valid NFT.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _tokenId | uint256 | The NFT to find the approved address for |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | The approved address for this NFT, or the zero address if there is none |

### isApprovedForAll

```solidity
function isApprovedForAll(address _owner, address _operator) external view returns (bool)
```

Query if an address is an authorized operator for another address



#### Parameters

| Name | Type | Description |
|---|---|---|
| _owner | address | The address that owns the NFTs |
| _operator | address | The address that acts on behalf of the owner |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | True if `_operator` is an approved operator for `_owner`, false otherwise |

### name

```solidity
function name() external view returns (string)
```

A descriptive name for a collection of NFTs in this contract




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### ownerOf

```solidity
function ownerOf(uint256 _tokenId) external view returns (address)
```

Find the owner of an NFT

*NFTs assigned to zero address are considered invalid, and queries  about them do throw.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _tokenId | uint256 | The identifier for an NFT |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | The address of the owner of the NFT |

### safeTransferFrom

```solidity
function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable
```

Transfers the ownership of an NFT from one address to another address

*This works identically to the other function with an extra data parameter,  except this function just sets data to &quot;&quot;.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _from | address | The current owner of the NFT |
| _to | address | The new owner |
| _tokenId | uint256 | The NFT to transfer |

### safeTransferFrom

```solidity
function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) external payable
```

Transfers the ownership of an NFT from one address to another address

*Throws unless `msg.sender` is the current owner, an authorized  operator, or the approved address for this NFT. Throws if `_from` is  not the current owner. Throws if `_to` is the zero address. Throws if  `_tokenId` is not a valid NFT. When transfer is complete, this function  checks if `_to` is a smart contract (code size &gt; 0). If so, it calls  `onERC721Received` on `_to` and throws if the return value is not  `bytes4(keccak256(&quot;onERC721Received(address,address,uint256,bytes)&quot;))`.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _from | address | The current owner of the NFT |
| _to | address | The new owner |
| _tokenId | uint256 | The NFT to transfer |
| data | bytes | Additional data with no specified format, sent in call to `_to` |

### setApprovalForAll

```solidity
function setApprovalForAll(address _operator, bool _approved) external nonpayable
```

Enable or disable approval for a third party (&quot;operator&quot;) to manage  all of `msg.sender`&#39;s assets

*Emits the ApprovalForAll event. The contract MUST allow  multiple operators per owner.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _operator | address | Address to add to the set of authorized operators |
| _approved | bool | True if the operator is approved, false to revoke approval |

### slotOf

```solidity
function slotOf(uint256 _tokenId) external view returns (uint256)
```

Get the slot of a token.



#### Parameters

| Name | Type | Description |
|---|---|---|
| _tokenId | uint256 | The identifier for a token |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | The slot of the token |

### slotURI

```solidity
function slotURI(uint256 _slot) external view returns (string)
```

Returns the Uniform Resource Identifier (URI) for the specified slot.

*This function SHOULD return the URI for `_slot` in JSON format, starting with header  `data:application/json;`.  See https://eips.ethereum.org/EIPS/eip-3525 for the JSON schema for slot URI.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _slot | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | The JSON formatted URI of `_slot` |

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) external view returns (bool)
```



*Returns true if this contract implements the interface defined by `interfaceId`. See the corresponding https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section] to learn more about how these ids are created. This function call must use less than 30 000 gas.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| interfaceId | bytes4 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### symbol

```solidity
function symbol() external view returns (string)
```

An abbreviated name for NFTs in this contract




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### tokenURI

```solidity
function tokenURI(uint256 _tokenId) external view returns (string)
```

A distinct Uniform Resource Identifier (URI) for a given asset.

*Throws if `_tokenId` is not a valid NFT. URIs are defined in RFC  3986. The URI may point to a JSON file that conforms to the &quot;ERC721  Metadata JSON Schema&quot;.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _tokenId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### transferFrom

```solidity
function transferFrom(uint256 _fromTokenId, address _to, uint256 _value) external payable returns (uint256)
```

Transfer value from a specified token to an address. The caller should confirm that  `_to` is capable of receiving ERC3525 tokens.

*This function MUST create a new ERC3525 token with the same slot for `_to` to receive  the transferred value.  MUST revert if `_fromTokenId` is zero token id or does not exist.  MUST revert if `_to` is zero address.  MUST revert if `_value` exceeds the balance of `_fromTokenId` or its allowance to the  operator.  MUST emit `Transfer` and `TransferValue` events.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _fromTokenId | uint256 | The token to transfer value from |
| _to | address | The address to transfer value to |
| _value | uint256 | The transferred value |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | ID of the new token created for `_to` which receives the transferred value |

### transferFrom

```solidity
function transferFrom(address _from, address _to, uint256 _tokenId) external payable
```

Transfer ownership of an NFT -- THE CALLER IS RESPONSIBLE  TO CONFIRM THAT `_to` IS CAPABLE OF RECEIVING NFTS OR ELSE  THEY MAY BE PERMANENTLY LOST

*Throws unless `msg.sender` is the current owner, an authorized  operator, or the approved address for this NFT. Throws if `_from` is  not the current owner. Throws if `_to` is the zero address. Throws if  `_tokenId` is not a valid NFT.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _from | address | The current owner of the NFT |
| _to | address | The new owner |
| _tokenId | uint256 | The NFT to transfer |

### transferFrom

```solidity
function transferFrom(uint256 _fromTokenId, uint256 _toTokenId, uint256 _value) external payable
```

Transfer value from a specified token to another specified token with the same slot.

*Caller MUST be the current owner, an authorized operator or an operator who has been  approved the whole `_fromTokenId` or part of it.  MUST revert if `_fromTokenId` or `_toTokenId` is zero token id or does not exist.  MUST revert if slots of `_fromTokenId` and `_toTokenId` do not match.  MUST revert if `_value` exceeds the balance of `_fromTokenId` or its allowance to the  operator.  MUST emit `TransferValue` event.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _fromTokenId | uint256 | The token to transfer value from |
| _toTokenId | uint256 | The token to transfer value to |
| _value | uint256 | The transferred value |

### valueDecimals

```solidity
function valueDecimals() external view returns (uint8)
```

Get the number of decimals the token uses for value - e.g. 6, means the user  representation of the value of a token can be calculated by dividing it by 1,000,000.  Considering the compatibility with third-party wallets, this function is defined as  `valueDecimals()` instead of `decimals()` to avoid conflict with ERC20 tokens.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint8 | The number of decimals for value |



## Events

### Approval

```solidity
event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId)
```



*This emits when the approved address for an NFT is changed or  reaffirmed. The zero address indicates there is no approved address.  When a Transfer event emits, this also indicates that the approved  address for that NFT (if any) is reset to none.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _owner `indexed` | address | undefined |
| _approved `indexed` | address | undefined |
| _tokenId `indexed` | uint256 | undefined |

### ApprovalForAll

```solidity
event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved)
```



*This emits when an operator is enabled or disabled for an owner.  The operator can manage all NFTs of the owner.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _owner `indexed` | address | undefined |
| _operator `indexed` | address | undefined |
| _approved  | bool | undefined |

### ApprovalValue

```solidity
event ApprovalValue(uint256 indexed _tokenId, address indexed _operator, uint256 _value)
```



*MUST emits when the approval value of a token is set or changed.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _tokenId `indexed` | uint256 | The token to approve |
| _operator `indexed` | address | The operator to approve for |
| _value  | uint256 | The maximum value that `_operator` is allowed to manage |

### SlotChanged

```solidity
event SlotChanged(uint256 indexed _tokenId, uint256 indexed _oldSlot, uint256 indexed _newSlot)
```



*MUST emit when the slot of a token is set or changed.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _tokenId `indexed` | uint256 | The token of which slot is set or changed |
| _oldSlot `indexed` | uint256 | The previous slot of the token |
| _newSlot `indexed` | uint256 | The updated slot of the token |

### Transfer

```solidity
event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId)
```



*This emits when ownership of any NFT changes by any mechanism.  This event emits when NFTs are created (`from` == 0) and destroyed  (`to` == 0). Exception: during contract creation, any number of NFTs  may be created and assigned without emitting Transfer. At the time of  any transfer, the approved address for that NFT (if any) is reset to none.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _from `indexed` | address | undefined |
| _to `indexed` | address | undefined |
| _tokenId `indexed` | uint256 | undefined |

### TransferValue

```solidity
event TransferValue(uint256 indexed _fromTokenId, uint256 indexed _toTokenId, uint256 _value)
```



*MUST emit when value of a token is transferred to another token with the same slot,  including zero value transfers (_value == 0) as well as transfers when tokens are created  (`_fromTokenId` == 0) or destroyed (`_toTokenId` == 0).*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _fromTokenId `indexed` | uint256 | The token id to transfer value from |
| _toTokenId `indexed` | uint256 | The token id to transfer value to |
| _value  | uint256 | The transferred value |



