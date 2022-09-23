import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cartModel.dart';
import '../../models/catalog.dart';

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
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool addToCart = _cart.items.contains(widget.catalog) ? true : false;
    return ElevatedButton(
      onPressed: () {
        if (!addToCart) {
          addToCart = addToCart.toggle();
          final _catalog = CatalogueModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);

          setState(() {});
        }
      },
      child:
          addToCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}
