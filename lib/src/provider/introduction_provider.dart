import 'package:fast_food_app/data/models/intro_model.dart';
import 'package:flutter/material.dart';

class IntroductionProvider extends ChangeNotifier {
  final controller = IntroductionWidget();

  final pageController = PageController();

  bool isLastPage = false;

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void jumpToPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/');
  }

  void backPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void updatePage(bool isLast) {
    isLastPage = isLast;

    notifyListeners();
  }
}
