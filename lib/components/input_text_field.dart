import 'package:flutter/material.dart';
import 'package:musicapp/utils/constants.dart';

class InputTextField extends StatelessWidget {
  InputTextField({this.icon, this.hint, this.obs, this.input});
  final IconData icon;
  final String hint;
  final bool obs;
  final Function input;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: input,
      obscureText: obs,
      style: kButtonTextStyle.copyWith(fontSize: 20),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: kButtonTextStyle.copyWith(
          color: Colors.grey,
        ),
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
