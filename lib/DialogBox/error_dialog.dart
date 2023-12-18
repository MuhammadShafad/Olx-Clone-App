import 'package:flutter/material.dart';
import 'package:pet_sell_app/WelcomeScreen/welcome_screen.dart';

class ErrorAlertDialog extends StatelessWidget {

  final String message;
  const ErrorAlertDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Text(message),
      actions: [
        ElevatedButton(
            onPressed: ()
            {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
            },
            child: const Center(
              child: Text('OK'),
            ),
        ),
      ],
    );
  }
}
