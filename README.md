# 🏨 LuxeStay - Premium Hotel Booking App

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge" alt="License" />
</div>

<p align="center">
  <strong>A luxurious, modern hotel booking application built with Flutter</strong>
</p>

---

## ✨ Features

### 🏠 **Home Screen**
- Premium hotel listings with mock data from Tangier, Morocco
- Interactive search card with location, dates, and guest selection
- Handpicked hotel recommendations with ratings and prices
- Popular destinations carousel
- Smooth horizontal scrolling hotel cards

### 🔍 **Search & Discovery**
- Advanced search results page with filter options
- Filter by: All, 5 Stars, Price (Low to High), Pool, Spa
- Beautiful hotel cards with images, ratings, and pricing
- "Popular" badges for trending hotels
- Floating "Map View" action button

### 🏨 **Hotel Details**
- Immersive full-screen hotel images
- Comprehensive amenity icons (Pool, Spa, Gym, Dining, WiFi)
- Expandable "About the Hotel" descriptions
- Location map integration
- Sticky booking footer with pricing
- Favorite/bookmark functionality

### 👤 **Authentication**
- Elegant login page with social sign-in options (Apple, Google)
- Registration page with terms & conditions
- Premium navy and gold color scheme
- Smooth form inputs with validation-ready fields

### 📱 **Profile**
- Member benefits showcase
- Login and registration access
- "Continue as Guest" option
- Clean, modern UI design

### 🎨 **Design System**
- **Color Palette**: Deep Navy (#0A1A3A), Metallic Gold (#D4AF37), Warm Off-White (#F8F7F4)
- **Typography**: Playfair Display (headers), DM Sans (body text)
- **UI Elements**: Rounded corners (24px), subtle shadows, glassmorphism effects

---

## 📱 Screenshots

> *Screenshots coming soon*

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / Xcode (for mobile development)
- Chrome (for web development)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/bilalakkar777/Hotel_FlutterApp_LuxeStay.git
   cd Hotel_FlutterApp_LuxeStay
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   
   For Chrome (Web):
   ```bash
   flutter run -d chrome
   ```
   
   For Android:
   ```bash
   flutter run -d android
   ```
   
   For iOS:
   ```bash
   flutter run -d ios
   ```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.2.1
  http: ^1.2.2
```

---

## 🏗️ Project Structure

```
lib/
├── main.dart                          # App entry point & home screen
├── models/
│   ├── place.dart                     # Place data model
│   └── place_details.dart             # Place details model
├── screens/
│   ├── auth_screens.dart              # Login & Register pages
│   ├── hotel_details_screen.dart      # Hotel details page
│   ├── profile_screen.dart            # Profile page
│   └── search_results_page.dart       # Search results page
└── services/
    ├── mock_data_service.dart         # Mock hotel data provider
    └── opentripmap_service.dart       # OpenTripMap API integration
```

---

## 🎯 Key Highlights

- ✅ **Cross-Platform**: Runs on iOS, Android, Web, macOS, Linux, and Windows
- ✅ **Premium UI/UX**: Luxury hotel booking experience with smooth animations
- ✅ **Bottom Navigation**: Seamless tab switching (Home, Search, Saved, Profile)
- ✅ **Mock Data**: Pre-loaded with 6 hotels from Tangier, Morocco
- ✅ **Responsive Design**: Adapts to different screen sizes
- ✅ **Modern Architecture**: Clean code structure with separation of concerns

---

## 🔮 Future Enhancements

- [ ] Real API integration with OpenTripMap
- [ ] Firebase authentication
- [ ] Booking flow implementation
- [ ] Payment gateway integration
- [ ] Favorites/wishlist persistence
- [ ] User reviews and ratings
- [ ] Multi-language support
- [ ] Dark mode theme
- [ ] Push notifications
- [ ] Advanced filtering and sorting

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/bilalakkar777/Hotel_FlutterApp_LuxeStay/issues).

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Bilal Akkar**

- GitHub: [@bilalakkar777](https://github.com/bilalakkar777)
- Repository: [Hotel_FlutterApp_LuxeStay](https://github.com/bilalakkar777/Hotel_FlutterApp_LuxeStay)

---

## 🙏 Acknowledgments

- Design inspiration from modern hotel booking platforms
- Google Fonts for beautiful typography
- OpenTripMap API for location data
- Flutter community for amazing packages and support

---

<div align="center">
  <p>Made with ❤️ using Flutter</p>
  <p>⭐ Star this repo if you like it!</p>
</div>
