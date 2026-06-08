import 'package:flutter/material.dart';
import 'package:ge01_crud_front/config/session_manager.dart';
import 'package:ge01_crud_front/providers/client_provider.dart';
import 'package:ge01_crud_front/providers/login_provider.dart';
import 'package:ge01_crud_front/providers/user_provider.dart';
import 'package:ge01_crud_front/screens/home_screen.dart';
import 'package:ge01_crud_front/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager.loadToken();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ClientProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
        },
        initialRoute: 'login',
      ),
    );
  }
}