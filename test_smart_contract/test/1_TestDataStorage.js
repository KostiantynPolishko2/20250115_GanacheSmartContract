const DataStorage = artifacts.require("./DataStorage.sol");

contract("DataStorage", accounts => {
    it("...to check basic functionality of 'DataStorage'", async()=>{
        const storage = await DataStorage.new();

        let balance = 5;
        await storage.setBalance(balance);
        const _balance = await storage.getBalance();

        assert.equal(_balance, balance, "Error! Unequal result.");
    })
});