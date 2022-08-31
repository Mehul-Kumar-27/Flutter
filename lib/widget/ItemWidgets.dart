// ignore_for_file: prefer_const_constructors

import 'package:codepur/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidgets extends StatelessWidget {
  final Items item;

  const ItemWidgets({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: ListTile(
          leading: Image.network(
            item.image,
            scale: 1.3,
          ),
          title: Text(item.name),
          subtitle: Text(item.decs),
          trailing: Text(
            "\$ ${item.price}",
            textScaleFactor: 1.7,
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
