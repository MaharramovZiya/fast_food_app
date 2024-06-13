import 'package:fast_food_app/data/models/product_item.dart';
import 'package:fast_food_app/data/models/products_models.dart';
import 'package:flutter/material.dart';

enum HomeState { normal, cart }

class HomeController extends ChangeNotifier {
  HomeState homeState = HomeState.normal;

  List<ProductItem> cart = [];

  void changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }

  void addProductCart(ProductsModel product) {
    for (ProductItem item in cart) {
      if (item.product!.title == product.title) {
        item.increment();
        notifyListeners();
        return;
      }
    }
    cart.add(ProductItem(product: product));
    notifyListeners();
  }

  void removeProductFromCart(ProductsModel product) {
    cart.removeWhere((element) => element.product!.title == product.title);
    notifyListeners();
  }

  int totalCartItems() => cart.fold(
      0, (previousValue, element) => previousValue + element.quantity);
}
