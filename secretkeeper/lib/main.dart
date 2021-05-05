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
        backgroundColor: Colors.white,
      ),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => Login(),
      },
      home: Login(),
    );
  }
}
