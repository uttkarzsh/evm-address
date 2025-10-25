//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { EllipticCurve } from "./EllipticCurve.sol";

contract AddressEVM {

    //Secp256k1 curve constants
    uint256 public constant GX =
        0x79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798;
    uint256 public constant GY =
        0x483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8;
    uint256 public constant AA = 0;
    uint256 public constant BB = 7;
    uint256 public constant PP =
        0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFC2F;


    // WARNING: Only for learning purpose. Do NOT deploy and put your real pvt key here lol.
    function publicKey(uint256 pvtKey) internal pure returns(uint256, uint256) {
        return EllipticCurve.ecMul(pvtKey, GX, GY, AA, PP);
    }

    function deriveAddress(uint256 pvtKey) public pure returns(address) {
        (uint256 qx, uint256 qy) = publicKey(pvtKey);       // generating the public key from the private key
        bytes32 hashedPubKey = keccak256(abi.encodePacked(qx, qy));     // hashing the public key
        bytes20 trimmedHashedPubKey = bytes20(uint160(uint256(hashedPubKey)));      // the evm address is the last 20 bytes of the hashed public key
        address derivedAddress = address(trimmedHashedPubKey);      // typecasting bytes20 into address
        return derivedAddress;
    }
}