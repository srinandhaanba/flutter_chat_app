import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ErrorHandler {
  String errorMessage;

  ErrorHandler({required this.errorMessage});
  getErrorMessage() {
    if (this.errorMessage ==
            "LateInitializationError: Field 'enteredEmail' has not been initialized." ||
        this.errorMessage ==
            "LateInitializationError: Field 'enteredPassword' has not been initialized.") {
      this.errorMessage = "Please enter your email and password";
    } else if (this.errorMessage ==
        "[firebase_auth/invalid-email] The email address is badly formatted.") {
      this.errorMessage = "Please enter your correct email address";
    } else if (this.errorMessage ==
        "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.") {
      this.errorMessage = "Please enter your correct password";
    } else if (this.errorMessage ==
        "[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred.") {
      this.errorMessage = "Please check your internet connection";
    } else if (this.errorMessage == "Instance of 'DomainError'") {
      this.errorMessage = "Please enter your domain mail address";
    } else if (this.errorMessage ==
        "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
      this.errorMessage = "This email address is already registered";
    }
    Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black26,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
