import 'package:fast_food_app/controllers/home_controller.dart';
import 'package:fast_food_app/data/models/products_models.dart';
import 'package:fast_food_app/src/components/home_components/category_menu.dart';
import 'package:fast_food_app/src/components/home_components/search_component.dart';
import 'package:fast_food_app/src/views/home_screen/components/cart_details_view.dart';
import 'package:fast_food_app/src/views/home_screen/components/cart_short_view.dart';
import 'package:fast_food_app/src/views/product_screen/product_view.dart';
import 'package:fast_food_app/src/widgets/appbar_widget.dart';
import 'package:fast_food_app/utils/constants/animation_constants.dart';
import 'package:fast_food_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //Controoler for animation
  final controller = HomeController();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  //
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    List<ProductsModel> filteredProductsList = selectedCategory != null
        ? productsList
            .where((item) => item.category == selectedCategory)
            .toList()
        : productsList;
    //Screen width
    double screenWidth = MediaQuery.of(context).size.width;
    //Container width
    double containerWidth = screenWidth / 2;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppbarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return LayoutBuilder(
                builder: (context, BoxConstraints constraints) {
                  return Column(children: [
                    const SearchComponent(),
                    const CategoryMenuComponent(),

                    AnimatedPositioned(
                      duration: panelTransition,
                      top: controller.homeState == HomeState.normal
                          ? headerHeight
                          : -(constraints.maxHeight -
                              cartBarHeight * 2 -
                              headerHeight),
                      left: 0,
                      right: 0,
                      height:
                          constraints.maxHeight - headerHeight - cartBarHeight,
                      child: GridView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: filteredProductsList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: containerWidth / 300,
                            crossAxisCount: screenWidth ~/ containerWidth,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2),
                        itemBuilder: (context, index) {
                          final product = filteredProductsList[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 500),
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 500),
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      FadeTransition(
                                    opacity: animation,
                                    child: ProductView(
                                      onProductRemove: () {
                                        controller.removeProductFromCart(
                                            filteredProductsList[index]);
                                      },
                                      product: filteredProductsList[index],
                                      onProductAdd: () {
                                        controller.addProductCart(
                                            filteredProductsList[index]);
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: containerWidth,
                              child: Container(
                                height: 200,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        offset: const Offset(0, 3))
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        flex: 3,
                                        child: Image.asset(
                                          product.image,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                product.title,
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Text(product.subtitle),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            product.price,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                controller.addProductCart(
                                                    filteredProductsList[
                                                        index]);
                                              },
                                              icon: const Icon(
                                                Icons.add_circle,
                                                color: CustomColors.primary,
                                                size: 30,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    //Cart panel
                    AnimatedPositioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: controller.homeState == HomeState.normal
                            ? cartBarHeight
                            : (constraints.maxHeight - cartBarHeight),
                        duration: panelTransition,
                        child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalGesture,
                          child: Container(
                            padding: EdgeInsets.all(defaultPadding),
                            color: Colors.white,
                            alignment: Alignment.topLeft,
                            child: AnimatedSwitcher(
                              duration: panelTransition,
                              child: controller.homeState == HomeState.normal
                                  ? CartShortView(homeController: controller)
                                  : CartDetailsView(controller: controller),
                            ),
                          ),
                        ))
                  ]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
