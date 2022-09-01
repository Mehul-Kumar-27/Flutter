import 'dart:convert';

import 'package:codepur/models/catalog.dart';
import 'package:codepur/widget/ItemWidgets.dart';
import 'package:codepur/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    final jsonProducts =
        await rootBundle.loadString("assets/files/products.json");
    final decodedData = jsonDecode(jsonProducts);
    var productData = decodedData["products"];
    print(productData);
  }

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
