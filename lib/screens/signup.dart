import 'package:flutter/material.dart';
import 'package:musicapp/utils/constants.dart';
import 'loginscreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                    hint: 'Email',
                    icon: Icons.mail,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputTextField(
                    hint: 'Password',
                    icon: Icons.lock,
                  ),
                ],
              ),
              //BUTTON AND A TEXT WIDGET
              Column(
                children: [
                  BottomButton(
                    coulor: Color(0xFFFF6D00),
                    text: 'SIGN UP',
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
