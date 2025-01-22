const ProductStorage = artifacts.require("ProductStorage");

module.exports = function (deployer, network, accounts) {
  const ownerAddress = accounts[0];
  deployer.deploy(ProductStorage, ownerAddress);
};