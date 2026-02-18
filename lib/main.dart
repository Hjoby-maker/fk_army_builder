import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'globals/app_state.dart';
import './app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appState = AppState();
  await appState.initialize();

  runApp(
    ChangeNotifierProvider.value(
      //create: (_) => AppState(),
      value: appState,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    return MaterialApp(
      title: 'Warhammer 40k Army Builder',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: appState.themeMode,

      // Используем роутер
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
