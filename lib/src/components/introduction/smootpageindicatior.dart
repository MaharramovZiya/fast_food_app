import 'package:fast_food_app/data/models/intro_model.dart';
import 'package:fast_food_app/src/provider/introduction_provider.dart';
import 'package:fast_food_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicatorComponent extends StatelessWidget {
  PageIndicatorComponent({super.key});
  final controller = IntroductionWidget();

  @override
  Widget build(BuildContext context) {
    final introProvider =
        Provider.of<IntroductionProvider>(context, listen: false);
    return Positioned(
      bottom: 160,
      child: SmoothPageIndicator(
        controller: introProvider.pageController,
        count: introProvider.controller.items.length,
        onDotClicked: (index) => introProvider.pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn),
        effect: WormEffect(
            strokeWidth: 1.5,
            dotHeight: 13,
            dotWidth: 13,
            activeDotColor: Colors.orangeAccent.shade700,
            dotColor: CustomColors.primary),
      ),
    );
  }
}
