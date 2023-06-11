// ignore_for_file: unused_field, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../components/rounded_btn.dart';
import './chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  const RegistrationScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool spinLoader = false;
  final _auth = FirebaseAuth.instance;

  // values for the text fields email and password
  late String email;
  late String password;

  void registerUser() async {
    setState(() {
      spinLoader = true;
    });

    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (newUser != null) {
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, ChatScreen.id);
      }

      setState(() {
        spinLoader = false;
      });
    } catch (e) {
      // ignore: avoid_print
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
                      // change the color of the text that user types in
                      hintText: 'Password must be atleast 6 char'),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                    title: 'Register',
                    btColor: Colors.blueAccent,
                    onPressed: () {
                      registerUser();
                    })
              ],
            ),
          ),
        ));
  }
}
