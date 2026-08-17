# CoinCap App 🪙

A Flutter-based cryptocurrency tracker that fetches real-time market data from the **CoinGecko API** and displays coin prices, 24h change, exchange-rate insights, and coin details in a clean mobile-friendly interface.

---

## 📌 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Screenshots](#-screenshots)
- [Getting Started](#-getting-started)
- [Project Structure](#-project-structure)
- [API Reference](#-api-reference)
- [Future Improvements](#-future-improvements)
- [Contributing](#-contributing)
- [Author](#-author)
- [Note](#-note)

---

## 📱 Overview

**CoinCap App** is a learning-focused Flutter project that demonstrates:

- API integration in Flutter
- Dynamic UI updates based on selected cryptocurrency
- Service abstraction using `Dio` and `GetIt`
- Clean, simple, and responsive interface design

The app currently supports popular coins like **Bitcoin, Ethereum, Cardano**, and more.

---

## ✨ Features

- 🔍 Real-time coin data fetched using HTTP requests
- 💵 Live USD price display
- 📉 24h percentage change
- 💱 Exchange rates in multiple currencies (details view)
- 📖 Coin descriptions from CoinGecko
- 🎯 Dropdown-based coin selection
- ⚡ Smooth and minimal Flutter UI

---

## 🛠️ Tech Stack

- **Framework:** Flutter 3+
- **Language:** Dart
- **API:** [CoinGecko API](https://www.coingecko.com/en/api) *(No API key required)*
- **Networking:** Dio
- **Service Locator:** GetIt

---

## 📸 Screenshots

<img width="1915" height="864" alt="image" src="https://github.com/user-attachments/assets/d3232af7-08c3-4685-aa80-9ea380b874cb" />

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed
- Android Studio / VS Code
- Android/iOS emulator or physical device

### Run Locally

```bash
git clone https://github.com/drishtichaudhary/CoinCap-App.git
cd CoinCap-App
flutter pub get
flutter run
```

### Run on Chrome (Optional)

```bash
flutter run -d chrome
```

---

## 📁 Project Structure

```text
lib/
├── models/
│   └── app_config.dart        # API base URL model
├── pages/
│   ├── home_pages.dart        # Home UI + coin selector
│   └── details_page.dart      # Exchange rate details page
├── services/
│   └── http_service.dart      # Dio-based API service
├── assets/
│   └── config/
│       └── main.json          # API base URL / config file
└── main.dart                  # Application entry point
```

---

## 🌐 API Reference

This app uses public CoinGecko endpoints for:

- coin market prices
- market metadata
- coin descriptions
- exchange-rate related details

🔗 Docs: https://www.coingecko.com/en/api

---

## 🔮 Future Improvements

- ⭐ Favorites / watchlist support
- 🔎 Search for any listed coin
- 📊 Mini trend charts (7d/30d)
- 🌙 Dark mode
- 🔔 Price alerts and notifications
- ⚡ Better caching and offline fallback

---

## 🤝 Contributing

Contributions are welcome.

1. Fork this repository  
2. Create a new feature branch  
3. Commit your changes  
4. Open a Pull Request  

---

## 👩‍💻 Author

**Drishti Chaudhary**  
GitHub: [@drishtichaudhary](https://github.com/drishtichaudhary)  
LinkedIn: [Drishti Chaudhary](https://www.linkedin.com/in/drishti-chaudhary-047855206/)

---

## 📝 Note

This project was built for learning and portfolio purposes to practice Flutter app development and real-time API integration.
