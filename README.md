# SentiBuzz
SentiBuzz is an iOS app that fetches top news headlines for a selected country and analyzes the sentiment of each article using the TextRazor API.

## Features
- Fetch top headlines using the News API.
- Analyze and summarize sentiment and topics using TextRazor.
- Clean and simple SwiftUI interface.
- Built for iPhone 16 simulator (Xcode 16.3+).

## Setup
1. Clone the repo:
   ```bash
   git clone https://github.com/avadacodavra/SentiBuzz.git
   ```
2. Open `SentiBuzz.swiftpm` in Xcode.
3. Add your API keys in `Utils/Constants.swift`:
   ```swift
   static let newsAPIKey = "YOUR_NEWSAPI_KEY"
   static let textrazorAPIKey = "YOUR_TEXTRAZOR_API_KEY"
   ```
4. Run the project on the iPhone 16 simulator.

## Dependencies
- SwiftUI
- URLSession (native networking)

## License
This project is licensed under the MIT License.

---

Would you also like a little badge section (like "Built with ❤️ in SwiftUI") or a GIF/screenshot usage guide? 🚀
