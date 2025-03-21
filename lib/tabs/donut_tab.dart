import 'package:donut_app_2a_martinez/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  final Function(double) onAddToCart;

  DonutTab({required this.onAddToCart});

  // Lista de donas
  final List donutsOnSale = [
    // [ donutFlavor, donutStore, donutPrice,  donutColor, imageName ]
    [
      "Ice Cream",
      "Krispy Kreme",
      36.0,
      Colors.blue,
      "lib/images/icecream_donut.png"
    ],
    [
      "Strawberry",
      "Dunkin donuts",
      45.0,
      Colors.red,
      "lib/images/strawberry_donut.png"
    ],
    [
      "Grape Ape",
      "Krispy Kreme",
      84.0,
      Colors.purple,
      "lib/images/grape_donut.png"
    ],
    [
      "Choco",
      "Dunkin donuts",
      95.0,
      Colors.brown,
      "lib/images/chocolate_donut.png"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: donutsOnSale.length,
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.5),
        itemBuilder: (context, index) {
          return DonutTile(
            donutFlavor: donutsOnSale[index][0],
            donutStore: donutsOnSale[index][1],
            donutPrice: donutsOnSale[index][2],
            donutColor: donutsOnSale[index][3],
            imageName: donutsOnSale[index][4],
            onAddToCart: () => onAddToCart(donutsOnSale[index][2]),
          );
        });
  }
}
