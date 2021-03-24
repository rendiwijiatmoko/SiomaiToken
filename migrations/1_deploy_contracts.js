const SiomaiToken = artifacts.require("SiomaiToken");

module.exports = function (deployer) {
  deployer.deploy(SiomaiToken);
};
