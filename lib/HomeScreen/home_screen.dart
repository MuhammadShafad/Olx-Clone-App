import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_sell_app/LoginScreen/login_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.teal,],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text("Home Screen"),
        leading: GestureDetector(
          onTap: ()
          {
            FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: const Icon(
            Icons.logout,
          ),
        ),
        ),
      ),
    );
  }
}
