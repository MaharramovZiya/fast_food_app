import 'package:fast_food_app/data/models/products_models.dart';

class ProductItem {
  int quantity;

  final ProductsModel? product;

  ProductItem({this.quantity = 1, required this.product});

  void increment() {
    quantity++;
  }
}
