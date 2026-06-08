import 'package:flutter/material.dart';
import 'package:ge01_crud_front/screens/home_screen.dart';
import 'package:ge01_crud_front/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
      },
      initialRoute: 'login',
    );
  }
}