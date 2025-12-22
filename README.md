# Solana Telegram for iOS

> Custom Telegram iOS client with advanced privacy features

## ✨ Features

### 🔒 Privacy
- **Ghost Mode** - Complete invisibility online
- **Anti-Read Receipts** - Don't send read confirmations
- **Voice Preview** - Listen to voice messages without marking as read
- **Deleted Messages History** - Save deleted messages locally
- **Anti-Screenshot** - Get notified when someone takes a screenshot

### 🎨 Customization
- **Custom Themes** - Midnight Purple, AMOLED, Aurora, and more
- **12 App Icons** - Choose your favorite icon style
- **7 Accent Colors** - Plus custom HEX color support
- **Chat Bubble Styles** - iOS, Android, Flat, Rounded
- **Custom Fonts** - Load your own fonts

### ⭐ Premium Features (Local)
- **Local Premium** - Activate premium features locally
- **No Ads** - Remove all sponsored content
- **Unlimited Stickers** - No limits on favorites

## 🚀 Installation

### Via AltStore (Recommended)
1. Download the latest IPA from [Releases](../../releases)
2. Install [AltStore](https://altstore.io/) on your device
3. Open the IPA file with AltStore
4. Enjoy!

### Via Sideloadly
1. Download the latest IPA
2. Install [Sideloadly](https://sideloadly.io/)
3. Connect your iPhone
4. Drop the IPA into Sideloadly
5. Sign in with your Apple ID

## 🔧 Building from Source

### Prerequisites
- macOS with Xcode 15+
- Python 3.11+
- Bazel

### Build Steps

```bash
# Clone the repository
git clone --recursive https://github.com/YOUR_USERNAME/Solana-iOS.git
cd Solana-iOS

# Install dependencies
pip install pyyaml
brew install bazelisk

# Create configuration
cp build-system/template_minimal_development_configuration.json build-config.json
# Edit build-config.json with your API credentials

# Generate Xcode project
python3 build-system/Make/Make.py \
  --cacheDir="$HOME/bazel-cache" \
  generateProject \
  --configurationPath=build-config.json \
  --xcodeManagedCodesigning

# Build
python3 build-system/Make/Make.py \
  --cacheDir="$HOME/bazel-cache" \
  build \
  --configurationPath=build-config.json \
  --buildNumber=1 \
  --configuration=release_arm64
```

## ⚙️ GitHub Actions

This project uses GitHub Actions for automated builds. To set up:

1. Fork this repository
2. Go to Settings → Secrets → Actions
3. Add the following secrets:
   - `TELEGRAM_API_ID` - Your Telegram API ID
   - `TELEGRAM_API_HASH` - Your Telegram API Hash
   - `APPLE_TEAM_ID` - Your Apple Team ID (optional)

4. Push to main branch to trigger a build
5. Download the IPA from Actions → Artifacts

## 📱 Requirements

- iOS 15.0 or later
- iPhone 6s or newer

## 🎨 Design

The app follows the "Midnight Purple" design language:

| Color | HEX | Usage |
|-------|-----|-------|
| Primary Purple | `#7C3AED` | Accents, buttons |
| Deep Purple BG | `#1E1B4B` | Main background |
| Dark Navy | `#0F0D2E` | Chat background |
| Light Purple | `#A78BFA` | Hover states |

## 📝 License

This project is based on [Telegram iOS](https://github.com/nicegram/Nicegram-iOS) and follows the same license terms.

## ⚠️ Disclaimer

This is an unofficial Telegram client. Use at your own risk. The developers are not responsible for any account restrictions.

## 🤝 Contributing

Contributions are welcome! Please read the contributing guidelines before submitting a pull request.

---

Made with 💜 for privacy