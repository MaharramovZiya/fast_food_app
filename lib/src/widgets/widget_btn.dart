import 'package:fast_food_app/controllers/home_controller.dart';
import 'package:fast_food_app/data/models/products_models.dart';
import 'package:fast_food_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class WidgetBtn extends StatefulWidget {
  const WidgetBtn({super.key, required this.text});
  final String text;

  @override
  State<WidgetBtn> createState() => _WidgetBtnState();
}

class _WidgetBtnState extends State<WidgetBtn> {
  final controller = HomeController();
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
 
    return GestureDetector(
      onTap: () {
        // controller.addProductCart(filteredProductsList[]);
        // Navigator.pushNamed(context, '/home');
      },
      child: Container(
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
            color: CustomColors.primary,
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(25)),
        width: MediaQuery.of(context).size.width / 1.4,
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17),
        ),
      ),
    );
  }
}
