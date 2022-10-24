const ethers = require("ethers")
const fs = require("fs-extra")

async function main() {
    const provider = new ethers.providers.JsonRpcProvider("http://172.25.112.1:7545")
    const wallet = new ethers.Wallet("fec0ac8764037e8356ccabfd58a5cdf6255819375a8b9bf6a53b5b7baa15f96b", provider)

    const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf-8")
    const abiIn = new ethers.utils.Interface(abi)
    const binary = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.bin", "utf-8")

    const contractFactory = new ethers.ContractFactory(abi, binary, wallet)
    console.log("Deploying.......")
    const contract = await contractFactory.deploy(); // deploy can take some args lik gas limit etc.
    console.log(contract)

}

main().then(() => process.exit(0))
.catch((error) => {
    console.error(error)
    process.exit(1);
})

//