import 'package:codepur/widget/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final Name = routeData['Name'];
    final Email = routeData['Email'];

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Catalog App"),
        ),
        body: Center(child: Text("Welcome to Catalod App")),
        drawer:MyDrawer(Name.toString() , Email.toString()));
  }
}
