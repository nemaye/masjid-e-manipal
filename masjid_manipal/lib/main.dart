import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Masjid-e-Manipal'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Buttons(
                text: 'Login',
                icon: Icon(Icons.login),
              ),
              // SizedBox(
              //   height: 10, for web app
              // ),
              Buttons(
                text: 'Sign Up',
                icon: Icon(Icons.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
