# 🕌 Islami App — Your Islamic Companion

**A modern Islamic application built with Flutter to bring the Holy Quran, Hadith, Azkar, prayer times, digital Tasbeeh, and Islamic radio together in one elegant and user-friendly experience.**

Islami App is designed to help Muslims access essential Islamic resources through a simple, organized, and responsive interface. With local Quran and Hadith data, interactive features, and a dedicated Islamic radio section, the app aims to make daily worship and spiritual learning more accessible.

---

## ✨ Features

### 📖 Holy Quran

A dedicated space for reading and exploring the Holy Quran.

* Browse all 114 Surahs.
* Open and read Surah details.
* Search for Surahs quickly.
* Access recently viewed Surahs.
* Save recent Quran activity locally.
* Read Quran content stored within the application.
* Enjoy a clean reading experience designed for comfortable navigation.

### 📜 Hadith

Explore Islamic Hadith through a simple and organized interface.

* Browse Hadith collections.
* Display Hadith content using interactive cards.
* Access locally stored Hadith data.
* Navigate between Hadith content with ease.
* Enjoy a readable layout focused on clarity and simplicity.

### 📿 Digital Tasbeeh

A digital companion for daily Tasbeeh and remembrance of Allah.

* Interactive Tasbeeh counter.
* Simple tap-to-count interaction.
* Clear counter display.
* Dedicated interface for a smooth and focused experience.

### 🕌 Prayer Times

Access the prayer times section through a dedicated Islamic-themed interface.

* Prayer times presentation.
* Organized prayer cards.
* Prayer date header.
* Integration with prayer-time data services.
* A foundation for accessing daily prayer schedules in one place.

### 🤲 Azkar & Supplications

A dedicated section for daily remembrance and supplications.

* Browse categorized Azkar.
* Access morning and evening Azkar.
* Read Azkar after obligatory prayers.
* Explore supplications from the Quran and Prophets.
* Access additional remembrance categories.
* Store Azkar content locally for convenient access.

### 📻 Islamic Radio

Listen to Islamic radio through a dedicated radio interface.

* Multiple Islamic radio channels.
* Play and pause controls.
* Volume controls.
* Interactive audio controls.
* An organized interface for accessing available radio streams.

### 🔊 Quran Audio & Background Playback

The application includes audio playback components built with Flutter audio packages.

* Audio playback infrastructure using `just_audio`.
* Background playback integration using `audio_service`.
* Support for integrating Quran recitations and radio streams.
* A dedicated audio service for playback management.

*Background playback behavior depends on the Android service configuration and the audio source being used.*

### 🔔 Adhan & Notifications

The app includes notification and audio components intended to support prayer reminders.

* Local notification integration.
* Adhan audio asset.
* Prayer notification scheduling infrastructure.
* Time-zone handling for scheduled notifications.
* Android notification and scheduling permissions.

*Actual notification timing and Adhan playback depend on device permissions, scheduling configuration, and background-execution restrictions.*

---

## 🎨 User Interface & User Experience

Islami App focuses on a consistent and accessible Islamic-themed design.

* Modern Islamic-inspired visual identity.
* Custom colors, fonts, icons, and backgrounds.
* Responsive layouts using `flutter_screenutil`.
* Reusable UI components.
* Smooth navigation between application sections.
* Intro and onboarding screens.
* Custom splash screen.
* Organized cards and content sections.
* Clean layouts designed for comfortable reading and interaction.

---

## 🛠️ Built With

The project is developed using Flutter and Dart, with packages selected for UI development, state management, networking, audio, and local data handling.

| Technology / Package            | Purpose                                                 |
| ------------------------------- | ------------------------------------------------------- |
| **Flutter**                     | Cross-platform application development                  |
| **Dart**                        | Application programming language                        |
| **Provider**                    | State management and sharing application state          |
| **flutter_bloc**                | Cubit and state-management architecture                 |
| **Dio**                         | HTTP requests and API communication                     |
| **Pretty Dio Logger**           | Network request and response logging during development |
| **just_audio**                  | Audio playback                                          |
| **audio_service**               | Background audio service integration                    |
| **audioplayers**                | Audio playback for assets such as the Adhan             |
| **audio_session**               | Audio session management                                |
| **flutter_local_notifications** | Local notifications and scheduled reminders             |
| **timezone**                    | Time-zone-aware notification scheduling                 |
| **flutter_timezone**            | Accessing the device's local time zone                  |
| **SharedPreferences**           | Lightweight local preference storage                    |
| **flutter_screenutil**          | Responsive UI sizing                                    |
| **Google Fonts**                | Typography and font integration                         |
| **Introduction Screen**         | Onboarding screens                                      |
| **Carousel Slider**             | Carousel-based UI components                            |
| **Intl**                        | Date formatting and internationalization                |
| **Flutter Native Splash**       | Native splash-screen configuration                      |

---

## 🏗️ Architecture & Development Approach

The project uses a feature-oriented approach to keep its screens, reusable components, data handling, and services organized.

### Key Development Concepts

* **Separation of concerns:** UI components, data models, and service logic are kept in separate areas where applicable.
* **State management:** Provider and Cubit are used for managing application state in different features.
* **API integration:** Dio is used for communicating with remote services.
* **Local-first content:** Quran, Hadith, and Azkar content can be accessed from bundled application assets.
* **Reusable components:** Shared widgets help maintain consistent UI patterns.
* **Dedicated services:** Audio playback and notification functionality are handled through service classes.


## 💾 Local Data Management

Islami App uses bundled assets and local storage to make selected content available without requiring a network request every time.

### Quran & Hadith

Quran and Hadith content is stored locally in application assets, allowing the app to load this content from the installed application.

### Azkar

Azkar content is organized into local JSON files and loaded when needed.

### Recently Viewed Surahs

`SharedPreferences` is used to persist lightweight user data, including recently viewed Surahs, so users can return to previously opened content more easily.

### Audio Assets

The Adhan audio file is bundled with the application under:

```text
assets/audio/adhan.mp3
```

---

## 🌐 API & Network Integration

The project includes a networking layer built with Dio for communicating with remote services.

Network-related components support:

* Sending Dio requests.
* Passing query parameters.
* Parsing API responses into Dart models.
* Handling network errors.
* Logging requests and responses during development.

Prayer-time data and other remote features depend on the API endpoints configured in the project.

## 📱 Application Sections

| Section          | Description                                             |
| ---------------- | ------------------------------------------------------- |
| 📖 Quran         | Browse and read the Holy Quran                          |
| 📜 Hadith        | Explore locally stored Hadith content                   |
| 📿 Sebha         | Count Tasbeeh through an interactive counter            |
| 🕌 Prayer Times  | View prayer-time information                            |
| 🤲 Azkar         | Browse categorized remembrance and supplications        |
| 📻 Islamic Radio | Access available Islamic radio streams                  |
| 🔊 Audio         | Audio playback infrastructure for recitations and radio |
| 🔔 Notifications | Prayer reminder and Adhan notification components       |

---

## 🔐 Permissions & Android Configuration

Some features require Android permissions or platform-specific configuration.

Depending on the enabled features, these may include:

* Notification permission.
* Exact-alarm scheduling permission.
* Foreground service permission for background audio.
* Media playback foreground-service permission.
* Wake lock permission where needed.
* Correct Android audio-service and notification configuration.

Background audio and scheduled notifications should be tested on a physical device, particularly when battery optimization or manufacturer-specific background restrictions are enabled.

---

## 🧪 Testing & Development

During development, the project can be checked with:

```bash
flutter analyze
```

Run the available tests with:

```bash
flutter test
```

Network logging can help diagnose API requests, response parsing, and connectivity issues during development.

---

## 🗺️ Future Improvements

Potential improvements for future versions include:

* 🎧 A complete Quran recitation player with Surah selection.
* ⏯️ Playback controls from the notification and lock screen.
* 📥 Downloaded recitations for offline listening.
* 📻 Expanded Islamic radio stations and stream management.
* 🔔 More reliable Adhan scheduling and playback.
* 📍 Location-based prayer-time configuration.
* 🧭 Qibla direction.
* 📿 Saved Azkar and customizable Tasbeeh sessions.
* 🔎 Improved Quran and Hadith search.
* 🌍 Arabic and English localization.
* 🌙 Dark mode and additional accessibility options.
* 🧪 Expanded unit and widget test coverage.

These are potential enhancements and should not be considered implemented features unless they are available in the current codebase.

---

## 🤝 Contributing

Contributions, suggestions, and improvements are welcome.

If you would like to contribute:

1. Fork the repository.
2. Create a feature branch.
3. Implement your changes.
4. Test your changes locally.
5. Open a pull request describing the improvement.

Please keep changes focused, maintain readable code, and test affected features before submitting a contribution.

---

## 📄 License

No license has been specified in this README. If you intend to publish or distribute this project publicly, consider adding a `LICENSE` file that clearly defines how others may use, modify, and distribute the code.

---

## 👨‍💻 Developer

**Omar Ahmed**

GitHub Repository:
https://github.com/OmarAhmed480/islamiapp




