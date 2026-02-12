import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/download_screen.dart';
import 'screens/builder_screen.dart';
import 'screens/saved_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/help_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/download':
        return MaterialPageRoute(builder: (_) => const DownloadScreen());
      case '/builder':
        return MaterialPageRoute(builder: (_) => const BuilderScreen());
      case '/saved':
        return MaterialPageRoute(builder: (_) => const SavedScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case '/help':
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Страница ${settings.name} не найдена'),
            ),
          ),
        );
    }
  }
}