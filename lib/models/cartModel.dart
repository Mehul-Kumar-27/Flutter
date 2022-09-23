import 'package:codepur/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  // Catalog field
  CatalogueModel? _catalog;

  //List to store the item Ids
  List<int> _itemIds = [];

  // get catalog
  CatalogueModel? get catalog => _catalog;

  // set catalog in cart model
  set catalog(CatalogueModel? newCatalog) {
    _catalog = newCatalog;
  }

  // add items in the cart
  List<Item?> get items => _itemIds.map((id) => _catalog?.getById(id)).toList();

  // get toatal price

  int? get toatlPrice =>
      items.fold(0, (total, current) => total! + current!.price);

  //Add items in the list

  void add(Item items) {
    _itemIds.add(items.id);
  }

  void remove(Item items) {
    _itemIds.remove(items.id);
  }
}
