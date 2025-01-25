const ProductMarket = artifacts.require("./ProductMarket.sol");



contract("ProductStorage", accounts => {
  it("...to store the values of struct 'Product'", async () => {

    const ownerAddress = accounts[0];
    // Use new instance of the contract
    // const productStorage = await ProductStorage.new(ownerAddress);

    // Use deployed instance to network
    const productMarket = await ProductMarket.deployed();

    // Load products to storage from library ProductData
    await productMarket.loadStorage();

    // Sell the product "milk"
    await productMarket.sellProduct("milk", 2);
  });
});
