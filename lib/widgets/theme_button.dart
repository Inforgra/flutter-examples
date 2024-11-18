import 'package:flutter/material.dart';
import 'package:flutter_examples/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: themeProvider.isLightMode
          ? IconButton(
              onPressed: () {
                themeProvider.changeTheme(ThemeMode.dark);
              },
              icon: const Icon(Icons.dark_mode),
            )
          : IconButton(
              onPressed: () {
                themeProvider.changeTheme(ThemeMode.light);
              },
              icon: const Icon(Icons.light_mode),
            ),
    );
  }
}
