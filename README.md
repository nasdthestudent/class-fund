# ClassFund 🎓

A simple smart contract built with Solidity to help manage class funds in a transparent way.  
Members can contribute ETH, the treasurer can withdraw, and all transactions are recorded on-chain.

---

## ✨ Features
- Add members at deployment
- Contribute ETH directly to the contract
- Track individual contributions
- Treasurer-only withdrawal
- Events for every payment & withdrawal
- (WIP) Period system for monthly payments

---

## 🛠 Tech Stack
- **Solidity** (smart contract language)
- **Remix IDE** (for development & deployment)
- **Metamask** (to interact with contract)
- **Sepolia Testnet** (for testing on Ethereum network)

---

## 🚀 How to Deploy
1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a new file `ClassFund.sol` and paste the contract code.
3. Compile with Solidity ^0.8.0.
4. In **Deploy & Run Transactions**:
   - Select **Injected Provider - Metamask**.
   - Choose **Sepolia Testnet** in Metamask.
   - Add the member addresses in the constructor.
   - Deploy the contract.

---

## 💡 How to Use
### Contribute
- Set the `value` field in Remix (e.g. `0.1 ether`)  
- Call `pay()` function  
- Your contribution will be recorded automatically  

### Withdraw (Treasurer only)
- Call `withdraw(uint _amount)`  
- `_amount` must be in **wei** (1 ether = 10^18 wei)  

---

## 📸 Demo
- Etherscan: [Contract on Sepolia](<https://sepolia.etherscan.io/address/0x43c9c8ced4655a2b7ee26d680935cb0d82bdf071#code>)  

---

## 📂 Repo Structure