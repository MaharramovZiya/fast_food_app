import 'package:fast_food_app/src/components/introduction/pageview_builder.dart';
import 'package:fast_food_app/src/components/introduction/smootpageindicatior.dart';
import 'package:fast_food_app/src/widgets/widget_btn.dart';
import 'package:flutter/material.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const IntroductionPageViewComponent(),
            PageIndicatorComponent(),
            const Positioned(
                bottom: 30,
                child: WidgetBtn(
                  text: "GET STARTED",
                ))
          ],
        ),
      ),
    );
  }
}
