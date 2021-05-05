import 'package:flutter/material.dart';
import 'package:secretkeeper/screens/login.dart';

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
        accentColor: Color(0xFF164F55),
        backgroundColor: Colors.white,
        fontFamily: 'Poppins',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(
                horizontal: 36,
                vertical: 24,
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
      },
      home: Login(),
    );
  }
}