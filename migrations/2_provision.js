const SkullpunksXG = artifacts.require("SkullpunksXG");
const path = require('path');
const csv = require('csvtojson');
module.exports = async function (deployer) {
  var nft = await SkullpunksXG.deployed()


  // const jsonArray=await csv().fromFile(path.resolve(__dirname, '../provision', 'ogs.csv'));
  
  // for (let index = 0; index < jsonArray.length; index++) {
  //   var element = jsonArray[index];
  //   var wallet = element['Wallet'];
  //   await nft.mintAllowanceProvision(wallet,1);
  //   console.log(element['Wallet'] + " @ " + index)
  // }


};
