import 'package:flutter/material.dart';
import 'signUp.dart';
import 'login.dart';

class Buttons extends StatelessWidget {
  final String text;
  final Icon icon;

  void login(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  void signUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUp(),
      ),
    );
  }

  const Buttons({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 120,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              if (text == 'Login') {
                login(context);
              } else {
                signUp(context);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text),
                icon,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
