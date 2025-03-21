import 'package:donut_app_2a_martinez/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  final Function(double) onAddToCart;

  DonutTab({required this.onAddToCart});

  final List donutsOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
    ["Plain donut", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Zelda Donut", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Spicy", "50", Colors.purple, "lib/images/grape_donut.png"],
    ["Sweets galore", "35", Colors.brown, "lib/images/chocolate_donut.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: donutsOnSale.length,
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.5),
        itemBuilder: (context, index) {
          double price = 0.0;
          try {
            price = double.parse(donutsOnSale[index][1]);
          } catch (e) {
            print("Error parsing price: ${donutsOnSale[index][1]}");
          }

          return DonutTile(
            donutFlavor: donutsOnSale[index][0],
            donutPrice: price,
            donutColor: donutsOnSale[index][2],
            imageName: donutsOnSale[index][3],
            donutStore: '',
            onAddToCart: () => onAddToCart(price),
          );
        });
  }
}
