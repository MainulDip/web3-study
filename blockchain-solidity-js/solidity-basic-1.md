### Overview:

### Setup Instructions :


### Compiler Version and Define Class/Contract (class is Contract):
```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract SimpleStorage {
    // boolean, uint (unsigned - only positive whole number), int (positive or negative), address, bytes
    // uint8 to uint256 (from 8 bit to 256 bit)
    bool hasFavoriteNumber = true;
    uint256 favoriteNumber; // default is uint256 and initial default value is 0
    string favText = "Seven"; // string are also bytes but only for strings
    int256 favInt = -7;
    address myAddress = 0xd12Cca947D5f31BCD8f5686d4D4dF096f7f475f7;
    bytes32 someBytes = "cat"; // converted to bytes // bytes2 to bytes32
}
```

### Solidity Constructor and With Inheritance:
* Direct
```solidity
contract Base {
   uint data;
   constructor(uint _data) public {
      data = _data;   
   }
}
contract Derived is Base (5) {
   constructor() public {}
}
```
* Indirect:
```solidity
contract Base {
   uint data;
   constructor(uint _data) public {
      data = _data;   
   }
}
contract Derived is Base {
   constructor(uint _info) Base(_info * _info) public {}
}
```

### Visibility Specifiers || Modifiers:
* public: visible externally and internally (creates a getter funxtion for storage/state variables)
* private: only visible in the current contract
* external: only visible externall (only for functions) - i.e. can only be message-called (via this.func)
* internal: only visible internally || Default

### Transaction:
* contracts are deployed through transaction. Also when variable/s changes, it will cost another transaction.

### Gas Cost: 
The more "stuff" in the function the more more gas it costs. Non view and pure function will not cost gas in called alone. But Other functions or state changing functions will cost gas as it will be conunted as a transaction. 


### Scope of variables:
local scoped variable is not accessible from outside, like other programming languages.

### Custom Getter:
view is for reading contract/state. View and pure funcitons don't allow state modifications. pure function don't allow reding block chain state/s.

also if a view function is called from a non-view/gas-costing function, it will cost gas as usual.
```solidity
// view and pure functions doesn't cost gas on change when called alone.
function retrieve() public view returns(uint256) {
    return someVariableUint254;
}

// pure function is just for math, not to change state or getter
function add() public pure returns(uint256){
    return (1+1);
}
```

### struct:
```solidity
 // defining new type by structure
   struct People {
       uint256 favoriteNumber;
       string name;
   }

   People public person = People({favoriteNumber: 2, name: "Patrick"});

   People public person2 = People(2, "Patrick"}); // implicit / without braces
```

### Automatic Indexing:
variables inside contract or struct get automatic indexing (0 based).

### Arrays:
```solidity
struct People {
    uint256 favoriteNumber;
    string name;
}

People[] public person; // dynamic empty array of People struct/type
People[12] public person; // fixed numbered empty array of People struct/type. It can hold 12 array/list

function addPerson(string memory _name, uint256 _favoriteNumber) public {
    People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
    // People memory newPerson = People(_favoriteNumber, _name); // without parameter name and braces
    person.push(newPerson);
}
```


### Memory, Storage, Calldata:
* EVM (ETH vertual machine) can access and store information in six places:
 - Stack:

 - Memory: temoporary variable (ie, function's param or inside functions), it is mutable. applicable for array (sting is also array), struct or mapping types.

 - Storage: parmanent variables, class/contract properties are by default get this notation.

 - Calldat: temoporary variable (ie, function's param or inside functions). it is immutable, so cannot be changed

 - Code :
 - Logs:

 ### Mapping:
 mapping is like dictionary in other languages, that store name/value pairs.
```solidity
 mapping(string => uint256) public nameToFavoriteNumber;
 nameToFavoriteNumber ["name"] = 1234;
```

 ```solidity
 // SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract SimpleStorage {
   uint256 public favoriteNumber;
   mapping(string => uint256) public nameToFavoriteNumber;

    // defining new type by structure
   struct People {
       uint256 favoriteNumber;
       string name;
   }

//    People public person = People({favoriteNumber: 2, name: "Patrick"});

    People[] public person; // dynamic empty array of People struct/type

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        People memory newPerson = People(_favoriteNumber, _name);
        person.push(newPerson);
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }


   function store(uint256 _favoriteNumber) public {
       favoriteNumber = _favoriteNumber;
   }

   function retrive() public view returns(uint256) {
       return favoriteNumber;
   }
}
 ```
### EVM (Etherium Vertual Machine) compatible Blockchains:
Avalanche, Fantom, Polygon

### Instantiation and Inheritance:
* type name = new Instance();
* function override: make the parent function "virtual" then add override on inheritance 

### Transactions Fields:
* Nonce : tx count for the account
* Gas Price: price per uint of gas (in wei)
* Gas Limit: max gas that is tx can use
* To: address that the tx is sent to
* Value: amount of wei to send
* Data: what to send to the to address
* v, r, s : components of tx signature

tx (transactions)
* smart contracts like wallet have the ability to hold fund (Etherium)
```solidity
function fund() public payable {
    number = 7; // cost gas because of mutating transaction

    require(msg.value > 1e18, "Didn't send enough"); // 1e18 = 10 to the power 18 (wei) = 1 ETH

    // require (conditin, revert)
    // revert = undo any action before and send remaining gas back
}
```

### Determinism Of Blockchain and consensus and Oracle Problem:
* Determinism in Computer Science refers to a system where the future state of the system is entirely determined by the prior state.
* A consensus mechanism refers to any number of methodologies used to achieve agreement, trust, and security across a decentralized computer network.

* Oracle Problem: If external API call's is not same/deterministic from all the decentralized node, they cannot agree to  reach the consensus. This is the oracle problem or smart contrat connectivity problem.

### Chainlink and Oracle Problem:
chainlink provide some decentralised way of making external API calls that could resolve oracle problem and help reach the consensus.
* Blockchain Oracle : Any device that interacts with the off-chain world to provide external data to computation to smart contracts.
https://docs.chain.link/
* Decentralised networ to convert ETH to USD.
* Chainlink Data Feeds: a way to connect smart contracts to the real-world data such as asset prices, reserve balances, and L2 sequencer health.

* Chainlink VRF (Verifiable Randomness Function): To get random number in a decentralized net.
* Chainlink Keepers: Event Listeners

### Solidity Destructuring:
```solidity
( , int price, , , ) = priceFeed.latestRoundData(); // Destructring
```

### Solidity Library:
* defining Library: 
```solidity
library LibraryName {
    // all the internal helper function definitions
    function getConversionRate(uint256 FirstParameter, uint256 SecondParameter, uint256 ThirdParameter) {
        // function's code
    }
}
```
* Applying Library:
```solidty
import "LibraryFileName.sol";
contract SomeContract {
    using LibraryName for type;

    function someFun() public {
        // calling library function
        FirstParameter.getConversionRate(SecondParameter, ThirdParameter);
    }
}
```

### FundMe.sol with and without library:
* without library
```solidty
// FundMe.sol file
// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// importing directly from npm package
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


contract FundMe {
    uint256 public minimumUsd = 50;

    function fund() public payable {
        // number = 7; // cost gas because of mutating transaction

        require(getConversionRate(msg.value) >= minimumUsd , "Didn't send enough"); // 1e18 = 10 to the power 18 (wei) = 1 ETH
    }

    
    function getPrice() public view returns(uint256) {
        // ABI
        // Address (Goerli Testnet ETH - USD) 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        
        // ( uint80 roundID, int price, uint startedAt, uint timeStamp, uint80 answeredInRound ) = priceFeed.latestRoundData(); // Destructring

        ( , int price, , , ) = priceFeed.latestRoundData(); // Destructring

        return uint256(price * 1e10);
    }

    function getVersion() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18; // in solidity do * in parenthesis first, then devide
        return ethAmountInUsd;  
    }

    function withdraw() public {}
}
```
* using library
```solidity
// PriceConverter.sol File
// importing directly from npm package
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    
    function getPrice() internal view returns(uint256) {
        // ABI
        // Address (Goerli Testnet ETH - USD) 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        
        // ( uint80 roundID, int price, uint startedAt, uint timeStamp, uint80 answeredInRound ) = priceFeed.latestRoundData(); // Destructring

        ( , int price, , , ) = priceFeed.latestRoundData(); // Destructring

        return uint256(price * 1e10);
    }

    function getVersion() internal view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18; // in solidity do * in parenthesis first, then devide
        return ethAmountInUsd;  
    }
}

// FundMe.sol File
import "./PriceConverter.sol";


contract FundMe {

    using PriceConverter for uint256;

    uint256 public minimumUsd = 50;

    address[] public funders;

    mapping(address => uint256) public addressToAmountFund;

    function fund() public payable {
        // number = 7; // cost gas because of mutating transaction
        
        require (msg.value.getConversionRate() >= minimumUsd , "Didn't send enough"); // 1e18 = 10 to the power 18 (wei) = 1 ETH
        
        funders.push(msg.sender);
        addressToAmountFund [msg.sender] = msg.value;
    }

    function withdraw() public {}
}
```

### Checked and Unchecked:
Prior to Solidity version 0.8, uints are unchecked ( if upper limit is excided, it will start counting from 0 again ). After V 0.8 every uints are checked ( if upperlimit is excided, it will throw an error). To make code more gas optimized, we can convert checked uint to unchecked uint by "unchecked { someUint = someUint + something; }"

### Looping:


### modifiers:
```solidity
// define modifier
modifier modifierName {
    require ( Check is something is True, "Return Error If Failed" );
    _; // anything after above code
}

// use modifiers
funstion someFun() public modifierName {
    // this function will not execute if the modifier requirements fail
}
```

### Advanced Solidity:
* constant : constant variable cost less gas than non-constant variable. "uint256 public constant MIMUM_USD = 77;" || have to set immidiatly and once
* immutable : can be set from constructor and once. "address public immutable i_owner;" and then set latter as usual.
note: constant and immutables are tied with bytecode of the contract instade of memory slots. That why they are fast to compute and gas efficient.
* custom error instade of require:
```solidity
// declare error outside of the contract
error NotOwner();

// apply custom error check and revert instade of require
if (msg.sender != owner ) { revert NotOwner(); } 
```

* receive special function (lower level function on CALLDATA)
```solidity
// inside contract
uint256 public result;
receive() external payable {
    result = 1;
}
// when ever transaction will happen it will be called
```
* callback function (special): when there are some data with transaction
```solidity
fallback() external payable {
    result = 2;
}
```

### Adavaced ++ Topics:
* Enums:
* Events:
* Try / Catch:
* Function Selectors:
* abi.encode / decode:
* Hashing:
* Yul / Assumbly:

### Ether.js Local Development Environment Settings:
* wsl
```sh
// list offline and online destors
wsl -l || wsl -l -o
// set default destro
wsl -s <DistributionName>
// set wsl 1 or 2
wsl --set-version <distro name> 2
```

### solc.js:
```sh
// adding solc js
yard add solc@0.8.7-fixed
// compiling solidity contract
yarn solcjs --bin --abi --include-path node_modules/ --bas
e-path . -o . SimpleStorage.sol
```

### Package setup

### Ganache & Networks:
Ganache is a fake blockchain server like remix or hardhat use.
* Install: https://trufflesuite.com/ganache/
* Change Ganache Server Settings to vEHTHERNET(WSL) in order to call from wsl
* network issue: https://ethereum.stackexchange.com/questions/130553/wsl-ubuntu-to-ganache-gui-on-windows-10-network-connection-error

### Ether.js Setup:
```sh
yarn add ethers
```