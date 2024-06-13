// This model for category

class CategoryBannerModel {
  String title;
  String icon;

  CategoryBannerModel({required this.icon, required this.title});
}

List<CategoryBannerModel> categoryBannerList = [
  CategoryBannerModel(icon: 'assets/icons/pizza.png', title: 'Pizza'),
  CategoryBannerModel(icon: 'assets/icons/burger.png', title: 'Burger'),
  CategoryBannerModel(icon: 'assets/icons/soda.png', title: 'Drinks'),
  CategoryBannerModel(icon: 'assets/icons/maki.png', title: 'Sushi'),
];

//This model for Products Pizza, sushi , hamburger

class ProductsModel {
  String image;
  String title;
  String subtitle;
  String price;
  String category;

  ProductsModel(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.category});
}

List<ProductsModel> productsList = [
  ProductsModel(
    image: "assets/img/ff1_img.png",
    title: "Mixed Pizza",
    subtitle: "pepperoni, mushrooms, and olives",
    price: "\$14.65",
    category: 'Pizza',
  ),
  ProductsModel(
      image: "assets/img/ff2_img.png",
      title: "Margerita Pizza",
      subtitle: "A classic Italian pizza",
      price: "\$22.43",
      category: 'Pizza'),
  ProductsModel(
      image: "assets/img/ff3_img.png",
      title: "Quattro Stagioni",
      subtitle: "artichokes, mushrooms, ham, and olives.",
      price: "\$27.54",
      category: 'Pizza'),
  ProductsModel(
      image: "assets/img/ff4_img.png",
      title: "Capricciosa",
      subtitle: "artichokes, green bell peppers, and black olives.",
      price: "\$33.44",
      category: 'Pizza'),
  ProductsModel(
      image: 'assets/img/ff5_img.png',
      title: 'Hamburger',
      subtitle: 'Hamburgers are mostly made with beef',
      price: '\$8.44',
      category: 'Burger'),
 
  ProductsModel(
      image: 'assets/img/ff6_img.png',
      title: 'Sushi',
      subtitle: 'Sushi is made from seafoods',
      price: '\$4.22',
      category: 'Sushi'),
];
