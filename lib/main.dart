import 'package:flutter/material.dart';
import 'package:flutter_examples/providers/theme_provider.dart';
import 'package:flutter_examples/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(context)),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  final String appTitle = 'Flutter Examples';
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.currentThemeMode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: MainScreen(appTitle: appTitle),
    );
  }
}
