// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:codepur/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${catalog.price}"
              .text
              .bold
              .color(Colors.redAccent)
              .size(25)
              .make(),
          ElevatedButton(
            onPressed: () {},
            child: "Buy".text.size(18).make(),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
                shape: MaterialStateProperty.all(StadiumBorder())),
          ).wh(125, 50)
        ],
      ).px20(),
      body: Container(
        color: Colors.black12,
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image))
                  .h40(context),
              Expanded(
                  child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white70,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        catalog.name.text.bold.black.size(20).make(),
                        10.heightBox,
                        catalog.desc.text
                            .textStyle(context.captionStyle)
                            .size(15)
                            .bold
                            .make(),
                        15.heightBox,
                        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
                            .text
                            .textStyle(context.captionStyle)
                            .make(),
                      ],
                    ).py64().px12(),
                  ),
                ),
              ))
            ],
          ).py2(),
        ),
      ),
    );
  }
}
