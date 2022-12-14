// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import "./Interfaces/IContractManager.sol";
import "hardhat/console.sol";
// import "./Interfaces/ITestClone.sol";

// import "./Interfaces/IStorage.sol";
import "./Interfaces/ISPFactory.sol";

contract TestStorages {
    ISPFactory public storageFactory;

    function setAddresses(address _StorageFactoryAddress) external {
        storageFactory = ISPFactory(_StorageFactoryAddress);
    }

    function storeTest(uint256 _storageNumber, uint256 _value) external {
        IStorage _storage = storageFactory.getStorage(_storageNumber);
        _storage.store(_value);
    }

    function getValueTest(uint256 _storageNumber)
        external
        view
        returns (uint256)
    {
        IStorage _storage = storageFactory.getStorage(_storageNumber);
        uint256 storedValue = _storage.getValue();
        return storedValue;
    }
}

// IContractManager public contractManager;
// function mintFromClone(
//     uint256 _cloneNumber,
//     uint256 _amount,
//     address _recipient
// ) external {
//     console.log("++++++++++++++++++++++++++");
//     IMyTokenV1 myTokenV1Cached = contractManager.getCloneInterface(
//         _cloneNumber
//     );
//     console.log("++++++++++++++++++++++++++");
//     myTokenV1Cached.mint(_recipient, _amount);
// }
// function balanceOfClone(uint256 _cloneNumber, address _account)
//     external
//     view
//     returns (uint256)
// {
//     console.log("+++++++++++++++++++++++++++");
//     IMyTokenV1 myTokenV1Cached = contractManager.getCloneInterface(
//         _cloneNumber
//     );
//     console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//     return myTokenV1Cached.balanceOf(_account);
// }
// function totalSupplyOfClone(uint256 _cloneNumber)
//     external
//     view
//     returns (uint256)
// {
//     IMyTokenV1 myTokenV1Cached = contractManager.getCloneInterface(
//         _cloneNumber
//     );
//     return myTokenV1Cached.totalSupply();
// }
