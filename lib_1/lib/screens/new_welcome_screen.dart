import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class MyWelcomeScreen extends StatelessWidget {
  static String id = 'new_welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 47, 61, 100.0),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
                child: Image.asset(
              'images/g1.png',
            )),
            SizedBox(
              height: 9,
            ),
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  'SECE Chat',
                  textStyle: TextStyle(
                    color: Color.fromRGBO(246, 182, 23, 40),
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 10,
                  ),
                )
              ],
              isRepeatingAnimation: true,
            ),
            Text(
              'Welcome to our private\n        messaging app',
              style: TextStyle(
                  color: Color.fromRGBO(244, 244, 244, 50),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              'Your Privacy is our concern',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
            FittedBox(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Next'),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
