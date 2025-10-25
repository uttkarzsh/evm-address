//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test, console } from "forge-std/Test.sol";
import { AddressEVM } from "../src/AddressEVM.sol";

contract TestAddressEVM is Test{
    AddressEVM addressGenerator;
    
    function setUp() public {
        addressGenerator = new AddressEVM();
    }

    function testDeriveAddressManual() public view {
        //anvil pvt key and address

        uint256 pvtKey = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;
        address userAddress = addressGenerator.deriveAddress(pvtKey);

        vm.assertEq(userAddress, 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
    }

    function testDeriveAddress() public {
        int256 rand = vm.randomInt();
        string memory user = vm.toString(rand);
        (address userAddress, uint256 userPvtKey) = makeAddrAndKey(user);       // generating random address and pvt key
        console.log("Expected address: ");
        console.logAddress(userAddress);

        address calculatedAddress = addressGenerator.deriveAddress(userPvtKey);     // generating the address using the pvt key
        console.log("Calculated Address: ");
        console.logAddress(calculatedAddress);

        vm.assertEq(userAddress, calculatedAddress);        // checking if the addresses match

    }
}