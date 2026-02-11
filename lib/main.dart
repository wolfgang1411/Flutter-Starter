import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:invoice_builder/core/router/app_routes.dart';
import 'package:invoice_builder/core/state/app_state.dart';
import 'package:invoice_builder/core/state/auth_state.dart';
import 'package:invoice_builder/core/state/theme_state.dart';
import 'package:invoice_builder/shared/layout/auth_wrapper.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const envFile = ".env";
  await dotenv.load(fileName: envFile);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()), // 👈 ADD THIS
        ChangeNotifierProvider(create: (_) => ThemeProvider()), // 👈 ADD THIS
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(), // you must create this
      themeMode: themeProvider.themeMode, // 👈 controlled by provider
      home: const AuthWrapper(),
    );
  }
}
