import 'package:codepur/models/cartModel.dart';
import 'package:codepur/pages/home_page_details.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../../pages/homePage.dart';
import 'addToCart.dart';

class CatalogueList extends StatelessWidget {
  // const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 40),
            itemCount: CatalogueModel.items!.length,
            itemBuilder: (context, index) {
              final catalog = CatalogueModel.items![index];
              return InkWell(
                  onTap: () => Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeDetailPage(catalog: catalog))),
                  child: CatalogItems(catalog: catalog));
            },
          )
        : ListView.builder(
            itemCount: CatalogueModel.items!.length,
            itemBuilder: (context, index) {
              final catalog = CatalogueModel.items![index];
              return InkWell(
                  onTap: () => Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeDetailPage(catalog: catalog))),
                  child: CatalogItems(catalog: catalog));
            },
          );
  }
}

class CatalogItems extends StatelessWidget {
  final Item catalog;

  const CatalogItems({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
            child: !context.isMobile
                ? Column(
                    children: [
                      Hero(
                          tag: Key(catalog.id.toString()),
                          child: CatalogImage(image: catalog.image)),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            catalog.name.text.bold.make(),
                            catalog.desc.text
                                .textStyle(context.captionStyle)
                                .make(),
                            10.heightBox,
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "\$${catalog.price}".text.bold.xl.make(),
                                AddToCart(
                                  catalog: catalog,
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  )
                : Row(
                    children: [
                      Hero(
                          tag: Key(catalog.id.toString()),
                          child: CatalogImage(image: catalog.image)),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            catalog.name.text.bold.make(),
                            catalog.desc.text
                                .textStyle(context.captionStyle)
                                .make(),
                            10.heightBox,
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "\$${catalog.price}".text.bold.xl.make(),
                                AddToCart(
                                  catalog: catalog,
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ))
        .purple100
        .rounded
        .square(150)
        .make()
        .py12();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .color(Color.fromARGB(255, 232, 201, 236))
        .rounded
        .p12
        .make()
        .p12()
        .wPCT(context: context, widthPCT: !context.isMobile ? 20 : 40);
  }
}
