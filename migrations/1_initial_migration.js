const SkullpunksXG = artifacts.require("SkullpunksXG");

module.exports = function (deployer) {
  var wallet = '0xde3E6601D4FdE06A7609f28dB92a103A295A50A1'
  var price = '35000000000000000' //0.035
  deployer.deploy(SkullpunksXG,wallet,price);
};
