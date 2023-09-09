import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:my_grocery/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'Welcome to My Grocery Application',

      image: Center(
        child: Image.asset('assets/images/img_1.png'),
      ),
      // Add a background color here
      decoration: PageDecoration(
        pageColor: Colors.black, // Set the background color
      ),
      // Other properties...
    ),
    PageViewModel(
      title: 'Get First Delivery Service ',
      body: 'Body 2',
      image: Center(
        child: Image.asset('assets/images/img_2.png'),
      ),
      // Other properties...
    ),
    PageViewModel(
      title: ('Best Quality Grocery Door to Door'),
      body: 'Body 3',
      image: Center(
        child: Image.asset('assets/images/img_3.png'),
      ),
      // Other properties...
    ),
    // Add more PageViewModels as needed...
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Colors.blue,
            activeSize: Size.square(20),
            activeColor: Colors.red,
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
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
