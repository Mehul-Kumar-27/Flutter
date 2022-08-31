import 'package:codepur/models/catalog.dart';
import 'package:codepur/widget/ItemWidgets.dart';
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
        body: ListView.builder(
            itemCount: CatalogModel.products.length,
            itemBuilder: (context, index) {
              return ItemWidgets(item: CatalogModel.products[index]);
            }),
        drawer: MyDrawer(Name.toString(), Email.toString()));
  }
}
