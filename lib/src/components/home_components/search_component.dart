import 'package:fast_food_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: CustomColors.lightGrey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey[600],
                    size: 31,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: const TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search for Food'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/blen.svg',
                  semanticsLabel: 'Image',
                  fit: BoxFit.cover,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_double_arrow_left_outlined,
                      color: Colors.white,
                      size: 30,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
