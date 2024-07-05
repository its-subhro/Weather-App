# Weather-app

This Flutter application allows users to check the weather using the OpenWeatherMap API. Users can view the current weather conditions for their location or any city they search for.

## Features

- Display current weather conditions including temperature, humidity, wind speed, etc.
- Search for weather by city name.
- Save favorite cities using SharedPreferences.
- Secure communication with the OpenWeatherMap API using HTTPS.

## Prerequisites

Before running the app, ensure you have the following installed:

- Flutter SDK: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
- Android/iOS Emulator or a physical device connected to your development machine.

## Installation

1. Clone the repository:

   ```
   git clone https://github.com/your/repository.git
   ```

2. Navigate into the project directory:

   ```
   cd Weather-app
   ```

3. Fetch dependencies:

   ```
   flutter pub get
   ```

## Configuration

### OpenWeatherMap API Key

1. Obtain an API key from [OpenWeatherMap](https://openweathermap.org/api) if you haven't already.
   
2. Create a file named `constant.dart` inside the `lib` directory.

3. Add your API key to `constant.dart`:

   ```dart
   // lib/constant.dart

   const String api_key = 'YOUR_API_KEY_HERE';
   ```

4. Make sure to add `constant.dart` to your `.gitignore` file to avoid committing it to version control.

## Packages Used

This project uses the following packages:

1. [`http`](https://pub.dev/packages/http): To make HTTP requests to the OpenWeatherMap API.
2. [`shared_preferences`](https://pub.dev/packages/shared_preferences): To save and retrieve favorite cities locally.

Ensure these packages are included in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.3
  shared_preferences: ^2.0.6
```

## How to Run

Ensure your emulator or device is running, and then execute:

```
flutter run
```

This command installs and runs the Flutter app on your connected device or emulator.

## Usage

- On launch, the app fetches weather data for the user's current location.
- Use the search functionality to find weather information for other cities.
- Save favorite cities by tapping on the star icon next to the city name. Saved cities persist across app restarts using SharedPreferences.

## Troubleshooting

- If you encounter issues with the API key or dependencies, double-check your configuration in `constant.dart` and ensure all dependencies are correctly installed using `flutter pub get`.

Make sure to replace placeholders like `your/repository.git` and `YOUR_API_KEY_HERE` with your actual repository URL and API key. This README file should provide a clear guide for users to understand how to set up, configure, and use your Weather-app effectively.