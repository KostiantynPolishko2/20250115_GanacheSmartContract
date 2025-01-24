const ProductStorage = artifacts.require("./ProductStorage.sol");



contract("ProductStorage", accounts => {
  it("...to store the values of struct 'Product'", async () => {

    const ownerAddress = accounts[0];
    // Use new instance of the contract
    // const productStorage = await ProductStorage.new(ownerAddress);

    // Use deployed instance to network
    const productStorage = await ProductStorage.deployed();

    // Load products to storage from library ProductData
    await productStorage.loadProduct();

    // Get struct of product "milk"
    const product = await productStorage.getProduct("milk");
    const info = product.getInfo();
    const property = info[0];
    assert.equal(property.name, "milk", "Error! Incorrect name.");

    // Add new product "cigarretes"
  });
});
