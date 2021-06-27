import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'verification.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  void login(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Verification(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Email',
                ),
                controller: myController,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (validate(myController.text)) {
                login(context);
                await sendOTP(myController.text);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Enter valid email'),
                  ),
                );
              }
            },
            child: Text('Send OTP'),
          )
        ],
      ),
    );
  }

  // void toast(BuildContext context) {
  //   print('object');
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('error'),
  //     ),
  //   );
  // }

  Future<http.Response?> sendOTP(String email) async {
    return http.post(
      Uri.parse('http://6c8a12f4a59e.ngrok.io'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(
        {"email": email},
      ),
    );
  }

  bool validate(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
      caseSensitive: false,
      multiLine: false,
    ).hasMatch(email);
  }
}
