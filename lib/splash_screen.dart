import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool showIntro = prefs.getBool('ON_BOARDING') ?? true;

  runApp(MaterialApp(
    title: 'My Grocery',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    // Display the SplashScreen first
    home: SplashScreen(),
    routes: {
      '/intro': (context) => IntroScreen(),
      '/home': (context) => HomeScreen(),
    },
    // After the splash screen, navigate to either IntroScreen or HomeScreen based on the condition.
    initialRoute: showIntro ? '/intro' : '/home',
  ));
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your splash screen content.
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Replace with the path to your app's logo.
              width: 150.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'Your App Name',
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

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Introduction'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the introduction screen!',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to HomeScreen when the "Let's Go" button is pressed.
                Navigator.of(context).pushReplacementNamed('/home');
              },
              child: Text("Let's Go"),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Welcome to the home screen!'),
      ),
    );
  }
}
