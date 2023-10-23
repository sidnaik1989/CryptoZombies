// SPDX-License-Identifier: GPL-3.0

// 1: Solidity version
pragma solidity >=0.8.2 <0.9.0;

// chapter 2: Contract 
// Create a can create zombies with a given name and maintain a record of all zombies created
contract ZombieFactory {

    // chapter 13: Events. Define event to be emitted on Zombie creation
    event NewZombie(uint zombieId, string name, uint dna);

    // chapter 3: State variables. Number of zombies
    uint public zombiesCreated = 0;

    // chapter 4: Structs. Defining a zombie
    struct Zombie {
        string name;  // name of the zombie
        uint dna;     // 16 digit DNA of the zombie 
    }

    // chapter 6: Arrays
    Zombie[] public zombies;

    // chapter 7: Function declarations. Create a public function to create a zombie
    function createZombie(string calldata _name) public returns (uint) {
        uint _dna = 1000000000000000;    // chapter 8: call private function. _dna = _generateDna(_name)

        // create a zombie and add to array
        Zombie memory z =  Zombie(_name, _dna);
        zombies.push(z);

        // increment count of zombies created
        zombiesCreated = zombiesCreated + 1;
        return zombiesCreated;
    }

    //chapter 8: Private functions. Create a DNA for the zombie based on the name
    /*function _generateDna(string memory _str) private pure returns (uint) {
        // hash the name string to get a 256 bit hash. Typecast it to a uint
        uint hashInt = uint(keccak256(abi.encodePacked(_str)));

        // calculate modulous with 10^16 to ensure the number is below 16 digits
        return hashInt % (10 ** 16);
    }*/

}
