import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/app_fonts.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PulpenKitaApp());
}

class PulpenKitaApp extends StatelessWidget {
  const PulpenKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulpen Kita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          surface: AppColors.surface,
        ),
        scaffoldBackgroundColor: AppColors.background,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.background,
          elevation: 0,
          titleTextStyle: AppTextStyles.title,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
