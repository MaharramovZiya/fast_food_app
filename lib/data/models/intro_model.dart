class IntroductionModel {
  final String title;
  final String descriptions;

  IntroductionModel({
    required this.title,
    required this.descriptions,
  });
}

class IntroductionWidget {
  List<IntroductionModel> items = [
    IntroductionModel(
      title: "Delicious Food",
      descriptions: "We help you to find best and delicious food",
    ),
    IntroductionModel(
      title: "Fast Delivery",
      descriptions:
          "We assist you in discovering the finest and most delicious cuisine",
    ),
    IntroductionModel(
      title: "Great Prices",
      descriptions:
          "Our mission is to help you uncover the best and most delectable food options",
    ),
  ];
}
