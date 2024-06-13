import 'package:fast_food_app/controllers/home_controller.dart';
import 'package:fast_food_app/utils/constants/animation_constants.dart';
import 'package:fast_food_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CartShortView extends StatelessWidget {
  const CartShortView({super.key, required this.homeController});

  final HomeController homeController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.shopping_cart_outlined,
          color: CustomColors.primary,
        ),
        const SizedBox(
          width: defaultPadding,
        ),
        Expanded(
            child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                homeController.cart.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(right: defaultPadding / 2),
                      child: Hero(
                          tag:
                              "${homeController.cart[index].product!.title}_cartTag",
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                                homeController.cart[index].product!.image),
                          )),
                    )),
          ),
        )),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            homeController.totalCartItems().toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomColors.primary,
                fontSize: 22),
          ),
        )
      ],
    );
  }
}
