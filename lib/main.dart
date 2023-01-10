import 'package:flutter/material.dart';
import 'package:flutter_pet_app/config/routes.dart';
import 'package:flutter_pet_app/screens/screen_exports.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.onboardingScreen,
      routes: {
        Routes.onboardingScreen: (context) => const OnboardingScreen(),
        Routes.loginScreen: (context) => const LoginScreen(),
        Routes.homeScreen: (context) => const HomeScreen(),
        Routes.registerScreen: (context) => const RegistrationScreen(),
        Routes.petDetailScreen: (context) => const PetDetailScreen(),
        Routes.bottomNav: (context) => const TabNavigation(),
        Routes.detailedChat: (context) => const ViewDetailedChatscreen(),
      },
    );
  }
}
