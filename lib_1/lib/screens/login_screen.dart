import 'package:chat_app/components/rounded_button_with_function.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'chat_screen.dart';
import 'package:chat_app/components/error_handler.dart';

class DomainError implements Exception {
  String errMsg() {
    return "Please enter your domain mail id.";
  }
}

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String enteredEmail;
  late String enteredPassword;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1E33),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    enteredEmail = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                      hintText: ' Enter your email'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    enteredPassword = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.grey,
                      ),
                      hintText: 'Enter your password'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButtonWithFunction(
                  color: Colors.lightBlueAccent,
                  textLabel: 'Log In',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      if (!enteredEmail.contains("sece.ac.in")) {
                        throw DomainError();
                      }
                      // final currentUser =
                      await _auth.signInWithEmailAndPassword(
                          email: enteredEmail, password: enteredPassword);
                      Navigator.pushNamed(context, ChatScreen.id);
                    } catch (e) {
                      print(e.toString());
                      ErrorHandler(errorMessage: e.toString())
                          .getErrorMessage();
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  },
                ),
                TextButton(
                  child: Text('Create new account'),
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
