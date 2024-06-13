import 'package:fast_food_app/data/models/products_models.dart';
import 'package:fast_food_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CategoryMenuComponent extends StatefulWidget {
  const CategoryMenuComponent({super.key});

  @override
  State<CategoryMenuComponent> createState() => _CategoryMenuComponentState();
}

class _CategoryMenuComponentState extends State<CategoryMenuComponent> {
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryBannerList.length,
        itemBuilder: (context, index) {
          final data = categoryBannerList[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = data.title;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: data.title == selectedCategory
                      ? CustomColors.primary
                      : CustomColors.pink,
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset(
                        data.icon,
                        width: 40,
                        scale: 1.8,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
