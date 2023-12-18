import 'package:flutter/material.dart';
import 'package:pet_sell_app/ForgetPassword/background.dart';

class ForgetPassword extends StatefulWidget {

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgetBackground(),
    );
  }
}
