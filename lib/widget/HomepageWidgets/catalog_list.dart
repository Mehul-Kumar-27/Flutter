import 'package:codepur/models/cartModel.dart';
import 'package:codepur/pages/home_page_details.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../../pages/homePage.dart';

class CatalogueList extends StatelessWidget {
  // const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogueModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogueModel.items![index];
        return InkWell(
            onTap: () => Navigator.push<void>(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog))),
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
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
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
        ))
      ],
    )).purple100.rounded.square(150).make().py12();
  }
}

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        //final catalog = CatalogueModel();
        final _cart = CartModel();
        _cart.add(widget.catalog);

        setState(() {});
      },
      child: isAdded ? Icon(Icons.done) : "Add to cart".text.make(),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
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
        .w40(context);
  }
}
