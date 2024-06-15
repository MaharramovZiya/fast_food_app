import 'package:flutter/material.dart';
import 'package:fast_food_app/utils/constants/colors.dart';

class WidgetBtn extends StatelessWidget {
  const WidgetBtn({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        Navigator.pop(context);
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
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17),
        ),
      ),
    );
  }
}
