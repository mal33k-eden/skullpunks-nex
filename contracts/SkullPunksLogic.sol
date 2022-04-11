// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
contract SkullPunksLogic is Ownable{

  mapping(address=>uint256) mintAllowance;
  mapping(address=>bool) mintAllowanceSatus;
 
  address payable public _wallet;
  uint256 public price;
  bool isFlashSale;
  address[] OGs = [ //whitelist of ogs that deserve free mints
    0x8f744d5038CA13d5C290213a9f082387b0214659,
    0x5372CDAB3305279fF00977F8C73f4B62d421EaEf,
    0xF0a1016593F8173322CAE4185cffe7125F6883D3
  ];


  constructor() Ownable(){


  }

  //mint called everytime signin successful in the dapp
  function initialMintAllowance(address _add,uint256 _allow) internal returns (bool){
    uint256 allowance   = mintAllowance[_add];
    mintAllowance[_add] = _allow + allowance;
    mintAllowanceSatus[_add] = true;
    return true;
  }
  //
  function addMintAllowance(address _add,uint256 _allow) public onlyOwner returns (bool){
    uint256 allowance   = mintAllowance[_add];
    mintAllowance[_add] =  allowance + _allow;
    return true;
  }
  function subMintAllowance(address _add,uint256 _allow) public onlyOwner returns (bool){
    uint256 allowance     = mintAllowance[_add];
    if(allowance > 0){
      mintAllowance[_add] = allowance - _allow;
    }
    return true;
  }
  function isInitialMint(address _add) public view returns (bool){
    return mintAllowanceSatus[_add];
  }
  //mint allance updated everytime mint is done
  function reduceMintAllowance(address _add) internal returns (bool){
    uint256 allowance = getMintAllowance(_add);
    if(allowance > 0){
      mintAllowance[_add] = allowance - 1;
    }
    return true;
  }

  //show allowace of address
  function getMintAllowance(address _add) public view returns (uint256){
    return mintAllowance[_add];
  }
   
  //forward to wallet
  function forwardEth() internal  returns (bool){
    _wallet.transfer(msg.value);
    return true;
  }

  //update price
  function updatePrice(uint256 _price) public  onlyOwner  returns (bool){
    price = _price ;
    return true;
  }
  //get price
  function getPrice() public view  returns (uint256){
    return price;
  }
  //update wallet
  function updateWallet(address payable wallet) public onlyOwner  returns (bool){
    _wallet = wallet;
    return true;
  }

 

}
