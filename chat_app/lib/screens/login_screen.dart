// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../components/rounded_btn.dart';
import './chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool spinLoader = false;
  final _auth = FirebaseAuth.instance;

  // values for the text fields email and password
  late String email;
  late String password;

  void logInUser() async {
    setState(() {
      spinLoader = true;
    });

    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // ignore: unnecessary_null_comparison
      if (user != null) {
        Navigator.pushNamed(context, ChatScreen.id);
      }

      setState(() {
        spinLoader = false;
      });
    } catch (e) {
      print('ERROR ---- $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: spinLoader,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                TextField(
                  onChanged: (value) {
                    //Do something with the user input.
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: kinputTextColor,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Your Email '),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                  onChanged: (value) {
                    //Do something with the user input.
                    password = value;
                  },
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: kinputTextColor,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Your Password '),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                    title: 'Log In',
                    btColor: Colors.lightBlueAccent,
                    onPressed: () {
                      logInUser();
                    }),
              ],
            ),
          ),
        ));
  }
}
