import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicapp/utils/constants.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
                  Hero(
                    tag: 'logo',
                    child: Icon(
                      FontAwesomeIcons.itunesNote,
                      color: Colors.white,
                      size: 90,
                    ),
                  ),
                  Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontFamily: 'NerkoOne',
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    'Welcome back',
                    style: kButtonTextStyle,
                  ),
                ],
              ),
              //TWO ETXT FIELDS
              Column(
                children: [
                  //first one
                  TextField(
                    style: kButtonTextStyle.copyWith(fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: kButtonTextStyle.copyWith(
                        color: Colors.grey,
                      ),
                      icon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  //second one
                  TextField(
                    style: kButtonTextStyle.copyWith(fontSize: 20),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: kButtonTextStyle.copyWith(
                        color: Colors.grey,
                      ),
                      icon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              //BUTTON AND A TEXT WIDGET
              Column(
                children: [
                  BottomButton(
                    coulor: Color(0xFFFF6D00),
                    text: 'LOG IN',
                    click: () {},
                  ),
                  SizedBox(
                    height: 30,
                    child: Divider(
                      color: Colors.white,
                      endIndent: 60,
                      indent: 60,
                    ),
                  ),
                  BottomButton(
                    coulor: Color(0xFFEA4335),
                    text: 'Google',
                    icon: FontAwesomeIcons.google,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Don\'t have an Account? Sign up',
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

class BottomButton extends StatelessWidget {
  BottomButton(
      {@required this.text, this.click, @required this.coulor, this.icon});
  final String text;
  final Function click;
  final Color coulor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: coulor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: Icon(icon),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Text(
                text,
                style: kButtonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
