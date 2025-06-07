# Campsite Finder

A Flutter application for finding and exploring campsites. This app allows users to browse through a list of campsites, filter them based on various criteria, and view detailed information about each campsite.

## Features

- Browse a list of campsites
- Filter campsites by:
  - Country
  - Proximity to water
  - Campfire allowance
  - Host language
  - Price per night
- View detailed information about each campsite
- Interactive map view showing campsite location
- Responsive design for web, Android, and iOS

## Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)
- Android Studio / Xcode (for mobile development)
- VS Code (recommended for development)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/campsite_finder.git
```

2. Navigate to the project directory:
```bash
cd campsite_finder
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
  ├── models/
  │   └── campsite.dart
  ├── providers/
  │   └── campsite_provider.dart
  ├── screens/
  │   ├── home_screen.dart
  │   └── campsite_detail_screen.dart
  ├── services/
  │   └── campsite_service.dart
  └── main.dart
```

## Technologies Used

- Flutter/Dart
- Riverpod for state management
- Freezed for immutable data classes
- flutter_map for map integration
- HTTP for API calls

## API

The app uses a mock API endpoint for campsite data:
```
https://62ed0389a785760e67622eb2.mockapi.io/spots/v1/campsites
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
