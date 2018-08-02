var Migrations = artifacts.require("./Migrations.sol");
var Proposal = artifacts.require("./Proposal.sol");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Proposal, 2);
};
