import 'package:codepur/models/cartModel.dart';
import 'package:codepur/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CartModel cartModel;
  late CatalogueModel catalog;

  MyStore() {
    cartModel = CartModel();
    catalog = CatalogueModel();
    cartModel.catalog = catalog;
  }
}
