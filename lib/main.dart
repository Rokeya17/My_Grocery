import 'package:flutter/material.dart';
import 'package:my_grocery/home_screen.dart';
import 'package:my_grocery/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool showIntro = prefs.getBool('ON_BOARDING') ?? true;

  runApp(MyApp(showIntro: showIntro));
}

class MyApp extends StatelessWidget {
  final bool showIntro;

  const MyApp({Key? key, required this.showIntro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Grocery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(
        showIntro: showIntro,
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  final bool showIntro;

  SplashScreen({required this.showIntro});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay for demonstration purposes.
    Future.delayed(Duration(seconds: 5), () {
      // After the delay, navigate to either IntroScreen or HomeScreen based on the condition.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              widget.showIntro ? IntroScreen() : HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Customize your splash screen UI here.
    return Scaffold(
      backgroundColor: Colors.blue, // Customize the background color.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your app logo or any other splash screen content here.
            Image.asset(
              'assets/images/img.png', // Replace with the path to your app's logo.
              width: 150.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'My Grocery',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
