var Migrations = artifacts.require("./Migrations.sol");
var Play = artifacts.require("./Play.sol");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Play, 2);
};
