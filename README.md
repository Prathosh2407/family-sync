# Family Sync

Family Sync is a Flutter application that helps families coordinate shared grocery lists and tasks. It uses Firebase Authentication and Cloud Firestore for family membership and shared data.

## Features
- Create a family and join using a family code
- Family member profiles and roles
- Shared grocery list and task management
- Cloud Firestore synchronisation
- Remembered local session preferences
- Light and dark themes

## Tech stack
Flutter / Dart, Firebase Core, Firebase Authentication, Cloud Firestore, Shared Preferences.

## Run locally
1. Install Flutter and Android Studio.
2. Clone this repository.
3. Configure Firebase for your own project. For Android, place your own `google-services.json` at `android/app/google-services.json`; it is intentionally excluded.
4. Deploy restrictive Firestore Security Rules enforcing authenticated, per-family access before using real data.
5. Run `flutter pub get`, then `flutter run`.

## Build an Android APK
```bash
flutter pub get
flutter build apk --release
```
The APK is generated at `build/app/outputs/flutter-apk/app-release.apk`.

## Security
Never commit service-account keys, `.env` secrets, local SDK paths, or private user data. Firebase client configuration is not an authorization boundary; use restrictive Firestore Security Rules.
