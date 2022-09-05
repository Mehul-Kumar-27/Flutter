// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:codepur/models/catalog.dart';
import 'package:codepur/widget/ItemWidgets.dart';
import 'package:codepur/widget/drawer.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override

  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final jsonProducts =
        await rootBundle.loadString('assets/files/products.json');
    final decodedData = await json.decode(jsonProducts);
    final productData = decodedData["products"];

    setState(() {
      CatalogueModel.items = List.from(productData)
          .map<Item>((item) => Item.fromMap(item))
          .toList();
    });
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              (CatalogueModel.items != null && CatalogueModel.items!.isNotEmpty)
                  ? ListView.builder(
                      itemCount: CatalogueModel.items!.length,
                      itemBuilder: (context, index) {
                        return ItemWidget(item: CatalogueModel.items![index]);
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
        ),
        drawer: MyDrawer(Name.toString(), Email.toString()));
  }
}
