import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_sell_app/DialogBox/error_dialog.dart';
import 'package:pet_sell_app/DialogBox/loading_dialog.dart';
import 'package:pet_sell_app/ForgetPassword/forget_password.dart';
import 'package:pet_sell_app/HomeScreen/home_screen.dart';
import 'package:pet_sell_app/LoginScreen/background.dart';
import 'package:pet_sell_app/SignupScreen/signup_screen.dart';
import 'package:pet_sell_app/Widgets/already_have_an_account_check.dart';
import 'package:pet_sell_app/Widgets/rounded_button.dart';
import 'package:pet_sell_app/Widgets/rounded_input_field.dart';
import 'package:pet_sell_app/Widgets/rounded_password_field.dart';

class LoginBody extends StatefulWidget {

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _login() async
  {
    showDialog(
        context: context,
        builder: (_)
        {
          return LoadingAlertDialog(message: 'Please wait',);
        }
    );

    User? currentUser;

    await _auth.signInWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
    ).then((auth)
    {
      currentUser = auth.user;
    }).catchError((error)
    {
      Navigator.pop(context);
      showDialog(context: context, builder: (context)
      {
        return ErrorAlertDialog(message: error.message.toString());
      });
    });

    if(currentUser != null)
    {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    else
    {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.04,),
              Image.asset('assets/icons/login.png',
              height: size.height * 0.32,
              ),
              SizedBox(height: size.height * 0.03,),
              RoundedInputField(
                  hintText: 'Email',
                  icon: Icons.person,
                  onChanged: (value)
                  {
                    _emailcontroller.text = value;
                  },
              ),
              const SizedBox(height: 6,),
              RoundedPasswordField(
                  onChanged: (value)
                  {
                    _passwordcontroller.text = value;
                  },
              ),
              const SizedBox(height: 8,),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: ()
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ForgetPassword()));
                  },
                  child: const Text(
                    'Forget Password',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              RoundedButton(
                  text: 'LOGIN',
                  press: ()
                  {
                    _emailcontroller.text.isNotEmpty && _passwordcontroller.text.isNotEmpty
                        ? _login()
                        : showDialog(
                        context: context,
                        builder: (context)
                        {
                          return const ErrorAlertDialog(message: 'Please write email & password for login');
                        }
                        );
                  },
              ),
              SizedBox(height: size.height * 0.03,),
              AlreadyHaveAnAccountCheck(
                login: true,
                press: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
              ),
            ],
          ),
        )
    );
  }
}
