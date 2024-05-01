# MockERC721





This is a mock contract of the ERC721 standard for testing purposes only, it SHOULD NOT be used in production.

*Forked from: https://github.com/transmissions11/solmate/blob/0384dbaaa4fcb5715738a9254a7c0a4cb62cf458/src/tokens/ERC721.sol*

## Methods

### approve

```solidity
function approve(address spender, uint256 id) external payable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| id | uint256 | undefined |

### balanceOf

```solidity
function balanceOf(address owner) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getApproved

```solidity
function getApproved(uint256 id) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| id | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### initialize

```solidity
function initialize(string name_, string symbol_) external nonpayable
```



*To hide constructor warnings across solc versions due to different constructor visibility requirements and syntaxes, we add an initialization function that can be called only once.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| name_ | string | undefined |
| symbol_ | string | undefined |

### isApprovedForAll

```solidity
function isApprovedForAll(address owner, address operator) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |
| operator | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

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
function ownerOf(uint256 id) external view returns (address owner)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| id | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |

### safeTransferFrom

```solidity
function safeTransferFrom(address from, address to, uint256 id) external payable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| id | uint256 | undefined |

### safeTransferFrom

```solidity
function safeTransferFrom(address from, address to, uint256 id, bytes data) external payable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| id | uint256 | undefined |
| data | bytes | undefined |

### setApprovalForAll

```solidity
function setApprovalForAll(address operator, bool approved) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| operator | address | undefined |
| approved | bool | undefined |

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) external view returns (bool)
```





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
function tokenURI(uint256 id) external view returns (string)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| id | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### transferFrom

```solidity
function transferFrom(address from, address to, uint256 id) external payable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| id | uint256 | undefined |



## Events

### Approval

```solidity
event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId)
```



*This emits when the approved address for an NFT is changed or reaffirmed. The zero address indicates there is no approved address. When a Transfer event emits, this also indicates that the approved address for that NFT (if any) is reset to none.*

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



*This emits when an operator is enabled or disabled for an owner. The operator can manage all NFTs of the owner.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _owner `indexed` | address | undefined |
| _operator `indexed` | address | undefined |
| _approved  | bool | undefined |

### Transfer

```solidity
event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId)
```



*This emits when ownership of any NFT changes by any mechanism. This event emits when NFTs are created (`from` == 0) and destroyed (`to` == 0). Exception: during contract creation, any number of NFTs may be created and assigned without emitting Transfer. At the time of any transfer, the approved address for that NFT (if any) is reset to none.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _from `indexed` | address | undefined |
| _to `indexed` | address | undefined |
| _tokenId `indexed` | uint256 | undefined |



