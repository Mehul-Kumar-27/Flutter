import 'package:codepur/models/cartModel.dart';
import 'package:codepur/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Item catalog;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: "Cart".text.center.make(),
      ),
      body: Column(
        children: [
          CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  // const _CartTotal({Key? key}) : super(key: key);
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.toatlPrice}".text.xl4.align(TextAlign.left).make(),
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            "Buying is not suppoeted yet !!!".text.make()));
                  },
                  child: "Buy".text.make())
              .w24(context),
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Nothing to show".text.make().centered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: ((context, index) => ListTile(
                  leading: Icon(CupertinoIcons.right_chevron),
                  trailing: IconButton(
                    icon: Icon(CupertinoIcons.check_mark),
                    onPressed: () {
                      _cart.remove(_cart.items[index]);
                      setState(() {});
                    },
                  ),
                  title: CatalogueModel.items![index].name.text.make(),
                )));
  }
}
