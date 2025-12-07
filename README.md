# 🎨 Switchy

[![pub package](https://img.shields.io/pub/v/switchy.svg)](https://pub.dev/packages/switchy)
[![Flutter Favorite](https://img.shields.io/badge/Flutter-Favorite-blue)](https://flutter.dev)
[![likes](https://img.shields.io/pub/likes/switchy)](https://pub.dev/packages/switchy/score)
[![points](https://img.shields.io/pub/points/switchy)](https://pub.dev/packages/switchy/score)
[![popularity](https://img.shields.io/pub/popularity/switchy)](https://pub.dev/packages/switchy/score)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Transform your Flutter apps with beautifully animated, fully customizable toggle switches that delight users.

---

## ✨ Why Fancy Switch?

Tired of boring, stock toggle switches? Fancy Switch brings your Flutter app to life with:

* 🎨 Gorgeous gradient animations that smoothly transition between states
* 🎭 Dual-icon support with separate icons for on/off states
* 📐 Pixel-perfect customization - control every aspect of the design
* ⚡ Buttery-smooth 60fps animations with customizable durations
* 🎯 Native Flutter experience - no platform-specific hacks

---

## 🚀 Quick Start

### 1. Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  switchy: ^1.0.0
  flutter_svg: ^2.0.0+1  # Optional, for SVG support
```

### 2. Basic Usage

```dart
import 'package:switchy/switchy.dart';

bool isEnabled = false;

Switchy(
  value: isEnabled,
  onChanged: (value) => setState(() => isEnabled = value),
  activeIcon: Icons.notifications_active,
  inactiveIcon: Icons.notifications_off,
  activeColors: [Colors.green, Colors.lightGreen],
  inactiveColors: [Colors.grey, Colors.blueGrey],
)
```

### 🎨 Features

#### 🌈 Gradient Colors

```dart
Switchy(
  value: isDarkMode,
  onChanged: (v) => setState(() => isDarkMode = v),
  activeIcon: Icons.nightlight_round,
  inactiveIcon: Icons.wb_sunny,
  activeColors: [Color(0xFF2C3E50), Color(0xFF34495E)],
  inactiveColors: [Color(0xFFF39C12), Color(0xFFE67E22)],
)
```

#### 🖼️ Icon & SVG Support

```dart
Switchy(
  activeIcon: Icons.wifi,
  inactiveIcon: Icons.wifi_off,
)

Switchy(
  activeIcon: 'assets/icons/moon.svg',
  inactiveIcon: 'assets/icons/sun.svg',
)
```

#### 📐 Complete Customization

```dart
Switchy(
  value: value,
  onChanged: onChanged,
  activeIcon: Icons.check,
  inactiveIcon: Icons.close,
  width: 120,
  height: 50,
  iconSize: 24,
  duration: Duration(milliseconds: 500),
  circlePadding: 6,
  circleMargin: 8,
  circleSizeRatio: 0.65,
  activeColors: [Colors.purple, Colors.deepPurple],
  inactiveColors: [Colors.blueGrey, Colors.grey],
)
```

### 📱 Examples

```dart
// Dark Mode Toggle
Switchy(
  value: darkMode,
  onChanged: (v) => setState(() => darkMode = v),
  activeIcon: Icons.nightlight_round,
  inactiveIcon: Icons.wb_sunny,
  activeColors: [Color(0xFF2C3E50), Color(0xFF34495E)],
  inactiveColors: [Color(0xFFF39C12), Color(0xFFE67E22)],
)

// Notifications Toggle
Switchy(
  value: notifications,
  onChanged: (v) => setState(() => notifications = v),
  activeIcon: Icons.notifications_active,
  inactiveIcon: Icons.notifications_off,
  activeColors: [Color(0xFF27AE60), Color(0xFF2ECC71)],
  inactiveColors: [Color(0xFF95A5A6), Color(0xFF7F8C8D)],
  width: 80,
  height: 36,
)

// Airplane Mode
Switchy(
  value: airplaneMode,
  onChanged: (v) => setState(() => airplaneMode = v),
  activeIcon: Icons.airplanemode_active,
  inactiveIcon: Icons.airplanemode_inactive,
  activeColors: [Color(0xFFE74C3C), Color(0xFFC0392B)],
  inactiveColors: [Color(0xFF3498DB), Color(0xFF2980B9)],
)
```

### ⚙️ API Reference

| Property        | Type               | Default            | Description                                    |
| --------------- | ------------------ | ------------------ | ---------------------------------------------- |
| value           | bool               | Required           | Current switch state                           |
| onChanged       | ValueChanged<bool> | Required           | Callback when state changes                    |
| activeIcon      | dynamic            | Required           | Icon for active state (IconData or SVG path)   |
| inactiveIcon    | dynamic            | Required           | Icon for inactive state (IconData or SVG path) |
| activeColors    | List<Color>        | [#27AE60, #2ECC71] | Gradient colors for active state               |
| inactiveColors  | List<Color>        | [#95A5A6, #7F8C8D] | Gradient colors for inactive state             |
| width           | double             | 70                 | Total width of the switch                      |
| height          | double             | 36                 | Total height of the switch                     |
| iconSize        | double             | 20                 | Size of icons                                  |
| duration        | Duration           | 400ms              | Animation duration                             |
| circlePadding   | double             | 6                  | Internal padding of the white circle           |
| circleMargin    | double             | 4                  | Margin from edges                              |
| circleSizeRatio | double             | 0.7                | Circle size relative to height                 |

### 🎯 Advanced Usage

#### Theme-Aware Switch

```dart
class ThemeSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Switchy(
      value: theme.brightness == Brightness.dark,
      onChanged: (isDark) {},
      activeIcon: Icons.nightlight_round,
      inactiveIcon: Icons.wb_sunny,
      activeColors: [theme.colorScheme.primary, theme.colorScheme.primary.withOpacity(0.8)],
      inactiveColors: [theme.colorScheme.secondary, theme.colorScheme.secondary.withOpacity(0.8)],
    );
  }
}
```

#### Custom Switch with SVG

```dart
Switchy(
  value: isPremium,
  onChanged: (v) => setState(() => isPremium = v),
  activeIcon: 'assets/icons/crown.svg',
  inactiveIcon: 'assets/icons/crown_outline.svg',
  activeColors: [Color(0xFFFFD700), Color(0xFFFFA500)],
  inactiveColors: [Color(0xFFBDC3C7), Color(0xFF7F8C8D)],
  width: 100,
  height: 45,
  iconSize: 22,
)
```

### 🤝 Contributing

* Fork the repository
* Create a feature branch: `git checkout -b feature/amazing-feature`
* Commit your changes: `git commit -m 'Add amazing feature'`
* Push to the branch: `git push origin feature/amazing-feature`
* Open a Pull Request

#### Development Setup

```bash
git clone https://github.com/yourusername/switchy.git
flutter pub get
cd example
flutter run
```

### 📖 FAQ

* Can I use custom SVG animations? Yes.
* How to change animation curve? Default `Curves.easeInOut`.
* RTL support? Yes.
* Can I use emojis? Use SVG versions or custom widget.

### 📊 Performance

* ✅ 60 FPS animations
* ✅ Minimal rebuilds
* ✅ Efficient painting
* ✅ Zero unnecessary state changes

### 🌟 Showcase

Used in productivity, social media, e-commerce apps, and more.

Share your creation! Tag [@YourHandle] or submit a PR.

### 📄 License

MIT License

Copyright (c) 2024 Your Name

Permission granted free of charge to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software.

### 🙏 Acknowledgments

* Flutter Team
* flutter_svg package
* All contributors
* You for using Switchy! 🎉

### 📞 Support

* Email: [your.email@example.com](mailto:your.email@example.com)
* Twitter: @YourHandle
* Discord: Join our community
* Issues: GitHub Issues

<div align="center">
Made with ❤️ for the Flutter community
[![Buy Me A Coffee](https://img.shields.io/badge/Buy%2520Me%2520A%2520Coffee-Support-yellow.svg)]
[![Sponsor GitHub](https://img.shields.io/badge/Sponsor-GitHub-blue.svg)]
</div>
