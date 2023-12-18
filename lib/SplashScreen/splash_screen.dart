import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_sell_app/WelcomeScreen/welcome_screen.dart';

import '../HomeScreen/home_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimer()
  {
    Timer( const Duration(seconds: 5), () async{
      if(FirebaseAuth.instance.currentUser != null)
      {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      else
      {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => WelcomeScreen()));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.teal,],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/logo.png', width: 350.0,),
              ),
              const SizedBox(height: 20.0,),

              const Center(
                child: Text(
                  'Choose your favourite pets',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Signatra',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
