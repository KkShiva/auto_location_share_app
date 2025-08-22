DEMO- [https://drive.google.com/file/d/1nohajppwKNhgySm-zH2Bd7r-cHPWlnPh/view?usp=sharing](url)

# auto_share_app



# 📍 Auto Share Location

A simple **Flutter app** that automatically shares your current GPS location.  
The app uses **Geolocator** for GPS, **Permission Handler** for location permissions, and **Share Plus** to send your location via the system share sheet (e.g., WhatsApp, SMS, or any other app).  

It also includes a single **green "RE-SHARE" button** styled like WhatsApp to quickly share your location again.

---

## ✨ Features
- 🔑 Requests location permission at runtime  
- 📡 Fetches current GPS coordinates with high accuracy  
- 🌍 Generates a **Google Maps link** to your location  
- 📲 Shares your location via WhatsApp or any installed sharing app  
- 🔁 "RE-SHARE" button for quick repeat sharing  
- 🟢 Clean and simple interface  

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed  
- Android Studio or VS Code with Flutter/Dart plugins  
- A connected Android device or emulator  

### Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/auto-share-location.git
   cd auto-share-location



2️⃣ Install Dependencies
flutter pub get

3️⃣ Run on Emulator / Device
flutter run

📱 Build Release APK

To build a release APK:

flutter build apk --release


The generated APK will be at:

build/app/outputs/flutter-apk/app-release.apk

🔒 Permissions Used

Location → To fetch your GPS coordinates

Internet (optional) → Needed for Google Maps links
