import 'package:codepur/pages/homePage.dart';
import 'package:codepur/pages/login.dart';
import 'package:codepur/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homePage: (context) => HomePage(),
      },
    );
  }
}
