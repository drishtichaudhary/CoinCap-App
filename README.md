# CoinCap App 🪙

CoinCap is a Flutter-based cryptocurrency price tracker app that uses the [CoinGecko API](https://www.coingecko.com/en/api) to display real-time prices, exchange rates, and market details of various popular coins like Bitcoin, Ethereum, Cardano, and more. 📊💰

---

## ✨ Features

- 🔍 Real-time coin data fetched using HTTP requests
- 📉 Live USD price and 24h % change for selected coins
- 💱 Exchange rates for multiple currencies (tap image to view)
- 📖 Coin descriptions from CoinGecko
- 🌙 Simple, clean UI with dropdown coin selection
- 🧑‍💻 Built with Flutter, Dio, and GetIt for service injection

---

## 🔧 Tech Stack

- Flutter 3+
- Dart
- CoinGecko API (No API key required)
- Dio (for HTTP requests)
- GetIt (for service locator pattern)

---

## 📱Screenshots
<img width="1915" height="864" alt="image" src="https://github.com/user-attachments/assets/d3232af7-08c3-4685-aa80-9ea380b874cb" />


## 🚀 Getting Started

### Prerequisites

- Flutter SDK installed
- Android/iOS emulator or real device

### Run Locally

```bash
git clone https://github.com/drishtichaudhary/CoinCap-App.git
cd CoinCap-App
flutter pub get
flutter run
```

---

## 📁 Project Structure
- lib/
- │
- ├── models/
- │   └── app_config.dart       # API base URL model
- │
- ├── pages/
- │   ├── home_pages.dart       # Home UI + coin selector
- │   └── details_page.dart     # Exchange rate list
- │
- ├── services/
- │   └── http_service.dart     # Dio-based API calls
- │
- ├── assets/
- │   └── config/
- │       └── main.json         # API base URL (editable)
- │
- └── main.dart                 # App entry point

---

## 🤝 Contributing
- Contributions, feedback, and suggestions are welcome!
- Feel free to fork, raise issues or submit pull requests.

--- 
## Note 📝
- This app was built for learning purposes and to practice API integration in Flutter apps.
- Feel free to customize and enhance it further! 💻

