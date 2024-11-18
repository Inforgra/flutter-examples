import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  BuildContext context;
  ThemeMode currentThemeMode = ThemeMode.system;

  ThemeProvider(this.context);

  bool get isLightMode => switch (currentThemeMode) {
    ThemeMode.system => View.of(context).platformDispatcher.platformBrightness == Brightness.light,
    ThemeMode.light => true,
    ThemeMode.dark => false,
  };

  void changeTheme(ThemeMode themeMode) {
    currentThemeMode = themeMode;
    notifyListeners();
  }
}
