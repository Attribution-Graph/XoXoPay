# XOXOPAY  
**Tap-to-Pay & Scan-to-Pay Crypto Payments on Stellar**

XOXOPAY is a Stellar-native payment application that enables users to pay **directly with crypto** using **tap-to-pay (NFC)** or **scan-to-pay (QR)**, while merchants receive **instant USD settlement via Stellar Anchors**.

No Apple Pay.  
No Google Pay.  
No cards.  


Just crypto → payment → USD settlement.

---

## 🚨 Problem

Modern digital payments are controlled by closed, centralized platforms like Apple Pay and Google Pay. These systems:

- Require bank-issued cards and intermediaries  
- Exclude billions without reliable banking access  
- Lock merchants into proprietary ecosystems  
- Offer no native way to spend crypto  

Meanwhile, crypto users still cannot easily spend their assets in the real world without first cashing out.

**Crypto is global and instant — but spending it isn’t.**

---

## 💡 Solution

XOXOPAY removes Big Tech wallets entirely.

Users:
- Transfer crypto directly into the XOXOPAY app  
- Pay in-store or online using **tap** or **scan**  
- Settle payments directly on the Stellar blockchain  

Merchants:
- Price goods in USD  
- Accept crypto without volatility  
- Receive USD instantly via Stellar Anchors  
- Withdraw to local bank accounts  

XOXOPAY turns Stellar into a **global, open payment network**.

---

## ✨ Key Features

### For Users
- Non-custodial Stellar wallet (XLM + Anchor stablecoins)
- Tap-to-Pay (NFC)
- Scan-to-Pay (QR)
- Direct crypto transfers (no cards, no banks)
- Path payments for automatic FX conversion
- Fast settlement (~5 seconds)
- Biometric security

### For Merchants
- Accept crypto, receive USD
- Instant settlement (T+0 balance update)
- Bank payouts via Anchors (T+1 / T+2)
- Merchant dashboard (transactions, balances, payouts)
- POS, mobile, and API integrations

---

## 🧱 Architecture Overview


---

## 🔁 Payment Methods

### 1️⃣ Tap-to-Pay (NFC)
Best for fast, in-person retail.

**Flow**
1. Merchant enters amount in USD
2. POS emits NFC payment request
3. User taps phone
4. Transaction is signed and submitted to Stellar
5. Merchant receives USD instantly

---

### 2️⃣ Scan-to-Pay (QR)
Best for universal access and online commerce.

**Flow**
1. Merchant displays QR code
2. QR encodes payment details (amount, asset, memo)
3. User scans and confirms
4. Stellar transaction settles
5. Merchant USD balance updates instantly

Supports:
- Dynamic QR
- Static QR
- Deep links (SEP-0007 compatible)

---

## 💱 Asset & Settlement Model

### User Pays With
- XLM  
- Anchor-issued USD stablecoins  

### Merchant Receives
- USD via Stellar Anchors  

If user pays in XLM:
- Stellar path payments convert XLM → USD atomically
- Merchant is shielded from volatility

---

## 🏦 Stellar Anchors

XOXOPAY relies on Stellar Anchors for:
- Fiat custody
- Stablecoin issuance
- Compliance (KYB / AML)
- Bank off-ramps

### Initial Target Regions
- Nigeria (USD domiciliary accounts)
- Kenya (USD → MPesa Global)
- Ghana (USD bank payouts)
- South Africa (USD settlement rails)
- USA / EU (regulated anchors)

---

## 🔐 Security & Compliance

- Non-custodial wallet by default
- Encrypted key storage
- Biometric authentication
- Merchant KYB required
- User KYC risk-based
- AML monitoring via Anchors

---

## 📦 Tech Stack (Proposed)

- **Blockchain:** Stellar
- **Wallet:** Stellar SDK (JS / Mobile)
- **Payments:** Path Payments, SEP-7 URIs
- **Anchors:** SEP-6 / SEP-24 / SEP-31
- **Frontend:** React / React Native
- **Backend:** Node.js

---




## 🛣️ Roadmap

### Phase 1
- Wallet & direct crypto transfers
- Scan-to-Pay (QR)
- Anchor USD settlement
- Merchant dashboard
- Tap-to-Pay (NFC)


---

## 🎯 Success Metrics

- 10,000+ payments in 24 months
- 500+ onboarded merchants
- <5s transaction finality
- <3 minute merchant onboarding
- 99.9% settlement reliability

---

## 🤝 Contributing

Contributions are welcome and encouraged 🚀
To contribute to XOXOPAY, please use the **fork-and-pull-request** workflow.

### 1️⃣ Fork the Repository

Click the **Fork** button at the top right of this repository to create your own copy under your GitHub account.

---

### 2️⃣ Clone Your Fork

```bash
git clone https://github.com/<your-username>/xoxopay.git
```

---

### 3️⃣ Navigate Into the Project

```bash
cd xoxopay
```

---

### 4️⃣ Add the Upstream Repository

This keeps your fork in sync with the main project.

```bash
git remote add upstream https://github.com/Fracverse/xoxopay.git
```

Verify remotes:

```bash
git remote -v
```

---

### 5️⃣ Install Dependencies

```bash
npm install
```

---

### 6️⃣ Create a Feature Branch

Always work on a new branch.

```bash
git checkout -b feature/your-feature-name
```

Examples:

* `feature/nfc-flow`
* `feature/merchant-dashboard`
* `fix/qr-scan-bug`

---

### 7️⃣ Start the Development Server

```bash
npm run dev
```

---

### 8️⃣ Commit Your Changes

Write clear, meaningful commit messages.

```bash
git add .
git commit -m "feat: add QR scan validation logic"
```

---

### 9️⃣ Push to Your Fork

```bash
git push origin feature/your-feature-name
```

---

### 🔟 Open a Pull Request

1. Go to your fork on GitHub
2. Click **New Pull Request**
3. Ensure the base repository is `Fracverse/xoxopay`
4. Describe **what you changed** and **why**

## 📜 License

MIT License.

---

## 🚀 One-Line Pitch

**XOXOPAY lets users pay directly with crypto — tap or scan — while merchants receive USD instantly via Stellar Anchors.**

---

## 🌍 Built on Stellar

XOXOPAY is built to strengthen the Stellar ecosystem by making crypto payments practical, open, and globally accessible.

