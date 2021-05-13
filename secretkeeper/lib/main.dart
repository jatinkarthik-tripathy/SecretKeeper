import 'package:flutter/material.dart';
import 'package:secretkeeper/screens/home.dart';
import 'package:secretkeeper/screens/login.dart';
import 'package:secretkeeper/screens/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SecretKeeper',
      theme: ThemeData(
        primaryColor: Color(0xFF164F55),
        accentColor: Color(0xFFE5E5E5),
        shadowColor: Colors.black.withOpacity(0.5),
        backgroundColor: Colors.white,
        fontFamily: 'Poppins',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36.0),
              ),
            ),
          ),
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => Login(),
        '/signup': (BuildContext context) => Signup(),
        '/home': (BuildContext context) => Home(),
      },
      home: Login(),
    );
  }
}
