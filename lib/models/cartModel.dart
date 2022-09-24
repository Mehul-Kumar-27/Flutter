import 'package:codepur/core.dart';
import 'package:codepur/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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

  void remove(Item? items) {
    _itemIds.remove(items?.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cartModel._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item ?item;

  RemoveMutation(this.item);

  @override
  perform() {
    store!.cartModel._itemIds.remove(item?.id);
  }
}
