
import 'package:darsenizami/dashboardscreen.dart';
import 'package:darsenizami/login.dart';
import 'package:darsenizami/splachscreen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jamia Arabia Abbasia',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),

      // First screen: Splash Screen
      initialRoute: '/',

      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        'HomeScreen':(context) => const HomeScreen(),
      },
    );
  }
}
