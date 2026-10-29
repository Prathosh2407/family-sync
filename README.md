# Family Sync

Family Sync is a Flutter mobile application for family collaboration. It helps family members coordinate shared grocery lists and tasks, with Firebase-backed authentication and Cloud Firestore synchronisation.

## Features

- Family creation and member joining
- Firebase Authentication
- Shared grocery lists and task management
- Cloud Firestore data synchronisation
- Persistent local session preferences
- Light/dark theme support

## Technology

- Flutter and Dart
- Firebase Core and Firebase Authentication
- Cloud Firestore
- Shared Preferences

## Getting started

1. Install the Flutter SDK and Android Studio.
2. Clone this repository.
3. Run `flutter pub get`.
4. Configure a Firebase project for the app. Add your own `android/app/google-services.json` locally; this file is intentionally not committed.
5. Review and deploy appropriate Firestore Security Rules before using real family data.
6. Run `flutter run`.

## Build an Android APK

```bash
flutter pub get
flutter build apk --release
```

The generated APK is at `build/app/outputs/flutter-apk/app-release.apk`.

## Security

- Do not commit `google-services.json`, service-account keys, `.env` files, or local SDK paths.
- Use Firestore Security Rules that enforce authenticated and per-family access.
- Never store real family information in public source files.

## Project status

Source code repository for the Family Sync application. Firebase configuration is intentionally supplied by each developer locally.
