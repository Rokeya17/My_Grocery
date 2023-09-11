import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final bool showOnboarding;

  const MyApp({
    Key? key,
    required this.showOnboarding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Grocery App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Grocery App'),
        ),
        body: const Center(
            // Your app content here
            ),
      ),
    );
  }
}
