import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:my_grocery/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'Welcome to My Grocery Application',
      body: '',
      image: Center(
        child: Image.asset('assets/images/L1.png'),
      ),
    ),
    PageViewModel(
      title: 'Get First Delivery Service',
      body: 'Body 2',
      image: Center(
        child: Image.asset('assets/images/img_2.png'),
      ),
    ),
    PageViewModel(
      title: 'Best Quality Grocery',
      body: 'Door to Door',
      image: Center(
        child: Image.asset('assets/images/img_3.png'),
      ),
    ),
    // Add more PageViewModels as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color here
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Colors.black54,
            activeSize: Size.square(20),
            activeColor: Colors.blueGrey,
          ),
          showDoneButton: true,
          done: const Text(
            'Done',
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: false,
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
