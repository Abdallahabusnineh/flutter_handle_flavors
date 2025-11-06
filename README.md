# Flutter Handle Flavors

A Flutter project demonstrating how to implement and manage multiple app flavors (environments) for different deployment scenarios.

## 📋 Table of Contents

- [What are Flavors?](#what-are-flavors)
- [Project Overview](#project-overview)
- [Available Flavors](#available-flavors)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running the App](#running-the-app)
  - [Using Command Line](#using-command-line)
  - [Using VS Code](#using-vs-code)
- [Building for Production](#building-for-production)
- [Android Configuration](#android-configuration)
- [iOS Configuration](#ios-configuration)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)

## 🎯 What are Flavors?

Flavors (also known as build variants or environments) allow you to create multiple versions of your app from a single codebase. Common use cases include:

- **Different API endpoints** for development, staging, and production
- **Different app names and icons** to distinguish between environments
- **Different feature flags** for testing new functionality
- **Separate analytics/tracking** for each environment
- **Multiple apps** installed on the same device simultaneously

## 📱 Project Overview

This project demonstrates a clean architecture for managing three flavors:

- **DEV** - Development environment for active development
- **QA** - Quality Assurance environment for testing
- **PROD** - Production environment for end users

## 🚀 Available Flavors

| Flavor | App Name        | Application ID           | Purpose                       |
| ------ | --------------- | ------------------------ | ----------------------------- |
| `dev`  | My Test App DEV | `com.create_flavors.dev` | Development and debugging     |
| `qa`   | My Test App QA  | `com.create_flavors.qa`  | Quality assurance and testing |
| `prod` | My Test App     | `com.create_flavors`     | Production release            |

## 📁 Project Structure

```
lib/
├── main_dev.dart      # Entry point for DEV flavor
├── main_qa.dart       # Entry point for QA flavor
├── main_prod.dart     # Entry point for PROD flavor
└── my_app.dart        # Shared app widget and UI

android/
└── app/
    └── build.gradle.kts  # Android flavor configuration

.vscode/
└── launch.json        # VS Code debug configurations
```

## ✅ Prerequisites

- Flutter SDK (3.7.2 or higher)
- Dart SDK (included with Flutter)
- Android Studio / Xcode (for mobile development)
- VS Code (optional, but recommended)

## 📥 Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd flutter_handle_flavors
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Verify installation**
   ```bash
   flutter doctor
   ```

## 🏃 Running the App

### Using Command Line

#### DEV Flavor

```bash
# Debug mode
flutter run --flavor dev -t lib/main_dev.dart

# Release mode
flutter run --flavor dev -t lib/main_dev.dart --release
```

#### QA Flavor

```bash
# Debug mode
flutter run --flavor qa -t lib/main_qa.dart

# Release mode
flutter run --flavor qa -t lib/main_qa.dart --release
```

#### PROD Flavor

```bash
# Debug mode
flutter run --flavor prod -t lib/main_prod.dart

# Release mode
flutter run --flavor prod -t lib/main_prod.dart --release
```

### Using VS Code

This project includes pre-configured launch configurations. Simply:

1. Open the project in VS Code
2. Go to **Run and Debug** (Ctrl+Shift+D / Cmd+Shift+D)
3. Select your desired configuration from the dropdown:
   - My Test App - DEV (Debug)
   - My Test App - DEV (Release)
   - My Test App - QA (Debug)
   - My Test App - QA (Release)
   - My Test App - PROD (Debug)
   - My Test App - PROD (Release)
4. Press F5 or click the play button

## 📦 Building for Production

### Build APK

#### Debug APK

```bash
# DEV
flutter build apk --flavor dev -t lib/main_dev.dart --debug

# QA
flutter build apk --flavor qa -t lib/main_qa.dart --debug

# PROD
flutter build apk --flavor prod -t lib/main_prod.dart --debug
```

#### Release APK

```bash
# DEV
flutter build apk --flavor dev -t lib/main_dev.dart --release

# QA
flutter build apk --flavor qa -t lib/main_qa.dart --release

# PROD
flutter build apk --flavor prod -t lib/main_prod.dart --release
```

### Build App Bundle (for Google Play Store)

```bash
# DEV
flutter build appbundle --flavor dev -t lib/main_dev.dart --release

# QA
flutter build appbundle --flavor qa -t lib/main_qa.dart --release

# PROD
flutter build appbundle --flavor prod -t lib/main_prod.dart --release
```

## 🤖 Android Configuration

The Android flavor configuration is defined in `android/app/build.gradle.kts`:

```kotlin
flavorDimensions += "default"
productFlavors {
    create("dev") {
        dimension = "default"
        applicationIdSuffix = ".dev"
        resValue("string", "app_name", "My Test App DEV")
    }
    create("qa") {
        dimension = "default"
        applicationIdSuffix = ".qa"
        resValue("string", "app_name", "My Test App QA")
    }
    create("prod") {
        dimension = "default"
        resValue("string", "app_name", "My Test App")
    }
}
```

### Key Points:

- Each flavor has a unique application ID suffix (except prod)
- App names are dynamically set for each flavor
- All flavors can be installed simultaneously on the same device

## 🍎 iOS Configuration

To configure iOS flavors, you'll need to:

1. Open `ios/Runner.xcworkspace` in Xcode
2. Create build schemes for each flavor (DEV, QA, PROD)
3. Configure bundle identifiers and display names
4. Set up appropriate signing certificates


## 🎨 Customization

### Adding New Flavors

1. **Create a new main file**

   ```dart
   // lib/main_staging.dart
   import 'package:flutter/material.dart';
   import 'package:flutter_handle_flavors/my_app.dart';

   void main() {
     runApp(MyApp(flavor: 'staging'));
   }
   ```

2. **Update Android configuration** in `android/app/build.gradle.kts`:

   ```kotlin
   create("staging") {
       dimension = "default"
       applicationIdSuffix = ".staging"
       resValue("string", "app_name", "My Test App STAGING")
   }
   ```

3. **Add VS Code launch configuration** in `.vscode/launch.json`:
   ```json
   {
     "name": "My Test App - STAGING (Debug)",
     "request": "launch",
     "type": "dart",
     "program": "lib/main_staging.dart",
     "args": ["--flavor", "staging"],
     "flutterMode": "debug"
   }
   ```

### Customizing Per Flavor

You can customize various aspects based on the flavor:

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key, this.flavor});
  final String? flavor;

  @override
  Widget build(BuildContext context) {
    // Different configurations based on flavor
    String apiUrl = _getApiUrl();
    bool enableLogging = flavor != 'prod';

    return MaterialApp(
      theme: _getThemeForFlavor(),
      home: MyHomePage(title: flavor ?? 'Flutter Demo'),
    );
  }

  String _getApiUrl() {
    switch (flavor) {
      case 'dev':
        return 'https://dev-api.example.com';
      case 'qa':
        return 'https://qa-api.example.com';
      case 'prod':
        return 'https://api.example.com';
      default:
        return 'https://dev-api.example.com';
    }
  }

  ThemeData _getThemeForFlavor() {
    // Return different themes for different flavors
    switch (flavor) {
      case 'dev':
        return ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green));
      case 'qa':
        return ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange));
      default:
        return ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple));
    }
  }
}
```

## 🔧 Troubleshooting

### Common Issues

**Issue:** `Flavor not found` error

```bash
# Solution: Make sure you're using the correct flavor name
flutter run --flavor dev -t lib/main_dev.dart
```

**Issue:** Multiple apps with the same ID

```bash
# Solution: Verify that each flavor has a unique applicationIdSuffix in build.gradle.kts
```

**Issue:** Build fails on Android

```bash
# Solution: Clean and rebuild
flutter clean
flutter pub get
flutter build apk --flavor dev -t lib/main_dev.dart
```

**Issue:** Can't see flavor configurations in VS Code

```bash
# Solution: Reload VS Code window
# Press Cmd+Shift+P (Mac) or Ctrl+Shift+P (Windows/Linux)
# Type "Developer: Reload Window"
```

## 📚 Additional Resources

- [Flutter Documentation - Build Flavors](https://docs.flutter.dev/deployment/flavors)
- [Android Documentation - Build Variants](https://developer.android.com/studio/build/build-variants)
- [iOS Documentation - Build Configurations](https://developer.apple.com/documentation/xcode/adding-a-build-configuration-file-to-your-project)


---

**Happy Coding!** 🚀
