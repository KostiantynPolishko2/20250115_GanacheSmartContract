const ProductStorage = artifacts.require("./ProductStorage.sol");

contract("ProductStorage", accounts => {
  it("...to store the values of struct 'Product'", async () => {
    const ownerAddress = accounts[0];

    // Use new instance of the contract
    // const productStorage = await ProductStorage.new(accounts[0]);

    // Use deployed instance to network
    const productStorage = await ProductStorage.deployed();

    // Get struct of product "milk"
    const product_milk = await productStorage.getProduct("milk");
    assert.equal(product_milk.name, "milk", "Error! Incorrect name.");

    // Add new product "cake"
    const newProduct = {
      name: "cake",
      category: "bakery",
      price: 156,
      quantity: 4,
      owner: ownerAddress
    }
    await productStorage.addProduct(newProduct);
    const product_cake = await productStorage.getProduct("cake");
    assert.equal(product_cake.price, 156, "Error! Incorrect price.");
  });
});
