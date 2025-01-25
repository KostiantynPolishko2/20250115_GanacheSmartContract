const ProductStorage = artifacts.require("ProductStorage");

module.exports = async function (deployer, network, accounts) {
  const ownerAddress = accounts[0];
  await deployer.deploy(ProductStorage, ownerAddress);
};