import 'package:flutter/material.dart';
import 'package:my_grocery/home_screen.dart';
import 'package:my_grocery/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Grocery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: show ? IntroScreen() : const HomeScreen(),
    );
  }
}
