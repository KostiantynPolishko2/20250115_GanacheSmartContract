const ProductMarket = artifacts.require("ProductMarket");

module.exports = async function (deployer, network, accounts) {
  const ownerAddress = accounts[0];
  await deployer.deploy(ProductMarket, ownerAddress);
};