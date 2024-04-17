// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { IERC165 } from "../interface/IERC165.sol";

library ERC165Checker {
    bytes4 private constant INTERFACE_ID_INVALID = 0xffffffff;

    function supportsERC165(address account ) internal view returns (bool) {
        return supportsERC165InterfaceUnchecked(account, type(IERC165).interfaceId) &&
            !supportsERC165InterfaceUnchecked(account, INTERFACE_ID_INVALID);
    }

    function supportsInterface(address account, bytes4 interfaceId) internal view returns (bool) {
        return supportsERC165(account) && supportsERC165InterfaceUnchecked(account, interfaceId);
    }

    function getSupportedInterfaces(address account, bytes4[] memory interfaceIds) internal view returns (bool[] memory) {
        bool[] memory interfaceIdSupported = new bool[](interfaceIds.length);

        if (supportsERC165(account)) {
            for (uint i = 0; i < interfaceIds.length; i++) {
                interfaceIdSupported[i] = supportsERC165InterfaceUnchecked(account, interfaceIds[i]);
            }
        }
        return interfaceIdSupported;
    }

    function supportAllInterfaces(address account, bytes4[] memory interfaceIds) internal view returns (bool) {
        if (!supportsERC165(account)) {
            return false;
        }

        for (uint i = 0; i < interfaceIds.length; i++) {
            if (!supportsERC165InterfaceUnchecked(account, interfaceIds[i])) {
                return false;
            }
        }
        return true;
    }

    function supportsERC165InterfaceUnchecked(address account, bytes4 interfaceId) internal view returns (bool) {
        bytes memory encodedParams = abi.encodeCall(IERC165.supportsInterface, (interfaceId));

        bool success;
        uint returnSize;
        uint returnValue;
        assembly {
            success := staticcall(30000, account, add(encodedParams, 0x20), mload(encodedParams), 0x00, 0x20)
            returnSize := returndatasize()
            returnValue := mload(0x00)
        }
        return success && returnSize >= 0x20 && returnValue > 0;
    }
}