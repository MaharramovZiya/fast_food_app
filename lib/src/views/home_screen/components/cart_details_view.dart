import 'package:fast_food_app/controllers/home_controller.dart';

import 'package:fast_food_app/src/views/home_screen/components/cart_detailsview_card.dart';
import 'package:fast_food_app/src/widgets/widget_btn.dart';
import 'package:fast_food_app/utils/constants/animation_constants.dart';
import 'package:fast_food_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CartDetailsView extends StatelessWidget {
  const CartDetailsView({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.shopping_cart_outlined,
            color: CustomColors.primary,
          ),
          ...List.generate(
            controller.cart.length,
            (index) => CartDetailsViewCard(
              productItem: controller.cart[index],
              onPressed: () {
                controller
                    .removeProductFromCart(controller.cart[index].product!);
              },
            ),
          ),
          const SizedBox(height: defaultPadding),
           SizedBox(
              width: double.infinity, child: WidgetBtn(
                onTap:(){},
                text: "Order now"),),
        ],
      ),
    );
  }
}
