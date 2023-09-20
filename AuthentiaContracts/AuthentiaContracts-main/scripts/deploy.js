// deploy.js
const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();

    const buyer = '0xdDEC3a00f6c88fd5c8BBD902F800833e4D356790';
    const terms = 'No';
    const product = 'Image';
    const price = 20;
    const accessTime = 10;

    //const Authentia = await ethers.getContractFactory('Authentia');
    const authentia = await ethers.deployContract('Authentia', [buyer, terms, product, price, accessTime]);

    let authentiaAddress = await authentia.getAddress();

    console.log("Authentia Contract deployed to:", authentiaAddress);
}

main().then(() => process.exit(0)).catch(error => {
    console.error("Error",error);
    process.exit(1);
});
