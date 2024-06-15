import 'package:fast_food_app/data/models/intro_model.dart';
import 'package:fast_food_app/src/provider/introduction_provider.dart';
import 'package:fast_food_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class IntroductionPageViewComponent extends StatefulWidget {
  const IntroductionPageViewComponent({super.key});

  @override
  State<IntroductionPageViewComponent> createState() => _IntroductionPageViewComponentState();
}

class _IntroductionPageViewComponentState extends State<IntroductionPageViewComponent> {
  final controller = IntroductionWidget();

  @override
  Widget build(BuildContext context) {
    final introProvider =
        Provider.of<IntroductionProvider>(context, listen: false);
    return Container( 
      padding: const EdgeInsets.all(10),
      color: CustomColors.pink,
      height: MediaQuery.of(context).size.height,
      child: PageView.builder(
        itemCount: 3,
        onPageChanged: (index) => setState(() {
          introProvider.isLastPage =
              introProvider.controller.items.length - 1 == index;
        }),
        physics: const BouncingScrollPhysics(),
        controller: introProvider.pageController,
        itemBuilder: (context, index) {
          final data = introProvider.controller.items[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 4,
                child: SizedBox(
                  child: SvgPicture.asset(
                    'assets/svg/layer.svg',
                    semanticsLabel: 'Image',
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          data.descriptions,
                          style: TextStyle(color: Colors.grey[600]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
