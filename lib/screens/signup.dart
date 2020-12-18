import 'package:flutter/material.dart';
import 'package:musicapp/utils/constants.dart';
import 'loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:musicapp/components/input_text_field.dart';
import 'package:musicapp/screens/homepage.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //TWO TEXT WIDGETS
              Column(
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontFamily: 'NerkoOne',
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    'Create your Acount',
                    style: kButtonTextStyle,
                  ),
                ],
              ),
              //TWO ETXT FIELDS
              Column(
                children: [
                  InputTextField(
                    obs: false,
                    hint: 'Email',
                    icon: Icons.mail,
                    input: (value) {
                      email = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputTextField(
                    obs: true,
                    hint: 'Password',
                    icon: Icons.lock,
                    input: (value) {
                      password = value;
                    },
                  ),
                ],
              ),
              //BUTTON AND A TEXT WIDGET
              Column(
                children: [
                  BottomButton(
                    coulor: Color(0xFFFF6D00),
                    text: 'SIGN UP',
                    click: () async {
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        if (newUser != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Have an Account? Log In',
                    style: kButtonTextStyle.copyWith(fontSize: 18),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
