import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicapp/screens/homepage.dart';
import 'package:musicapp/screens/loginscreen.dart';
import 'package:musicapp/screens/signup.dart';
import 'package:musicapp/utils/constants.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/wall.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(''),
              Column(
                children: [
                  Icon(
                    FontAwesomeIcons.itunesNote,
                    color: Colors.white,
                    size: 90,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Void ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontFamily: 'NerkoOne',
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          'Player',
                          style: TextStyle(
                            color: Color(0xFFFF6D00),
                            fontSize: 50,
                            fontFamily: 'NerkoOne',
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  BottomButton(
                    coulor: Color(0xFFFF6D00),
                    text: 'Continue as Guest',
                    click: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: WelcomeButton(
                      click: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      buttonColor: Color(0xFFFF6D00),
                      text: 'SIGN UP',
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      click: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LogInScreen()));
                      },
                      buttonColor: Colors.black,
                      text: 'LOG IN',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeButton extends StatelessWidget {
  WelcomeButton({this.buttonColor, this.text, this.click});
  final Color buttonColor;
  final String text;
  final Function click;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 50,
        color: buttonColor,
        child: Center(
          child: Text(
            text,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
