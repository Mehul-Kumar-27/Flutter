// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:codepur/core.dart';
import 'package:codepur/models/cartModel.dart';
import 'package:codepur/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:codepur/models/catalog.dart';

import 'package:codepur/widget/drawer.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

import '../widget/HomepageWidgets/catalog_header.dart';
import '../widget/HomepageWidgets/catalog_list.dart';

import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

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

    final _cart = (VxState.store as MyStore).cartModel;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
        ),
        body: SafeArea(
          child: Container(
              color: Colors.white12,
              padding: Vx.m24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogueHeader(),
                  if (CatalogueModel.items != null &&
                      CatalogueModel.items!.isNotEmpty)
                    CatalogueList().py16().expand()
                  else
                    CircularProgressIndicator().centered().expand(),
                ],
              )),
        ),
        drawer: MyDrawer(Name.toString(), Email.toString()),
        floatingActionButton: VxBuilder(
          mutations: {RemoveMutation, AddMutation},
          builder: (context, MyStore, _) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartPage),
            child: Icon(CupertinoIcons.cart),
          ).badge(
              color: Vx.red400,
              count: _cart.items.length,
              size: 20,
              textStyle:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.black)),
        ));
  }
}
