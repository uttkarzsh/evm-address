# Ethereum Address Derivation (Solidity + Foundry)

A simple learning project that demonstrates how an Ethereum address is derived from a private key directly in Solidity, using the **secp256k1** curve.

It performs:
1. Public key generation from a private key (`k * G` on secp256k1)
2. Hashing the public key with `keccak256`
3. Taking the last 20 bytes to form the Ethereum address

---

### ⚠️ Warning
This project is **for educational purposes only**.  
Do **NOT** deploy it or use any **real private keys**.  
Doing so can permanently expose your wallet and funds.

---

### 🧪 Run Locally

```bash
# Clone the repository
git clone https://github.com/uttkarzsh/evm-address
cd evm-address

# Install Foundry (if not installed)
curl -L https://foundry.paradigm.xyz | bash
foundryup

# Run the tests
forge install
forge test -vv