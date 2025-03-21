import 'package:donut_app_2a_martinez/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  final Function(double) onAddToCart;

  SmoothieTab({required this.onAddToCart});

  final List donutsOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", "36", Colors.blue, "lib/images/Smoothie4.png"],
    ["Strawberry", "45", Colors.red, "lib/images/Smoothie6.png"],
    ["Grape ", "84", Colors.purple, "lib/images/Smoothie9.png"],
    ["Chocolate", "95", Colors.brown, "lib/images/Smoothie5.png"],
    ["Mocca", "36", Colors.blue, "lib/images/ChocoSmoothie8.png"],
    ["Orange", "45", Colors.red, "lib/images/OrangeSmoothie3.png"],
    ["Apple", "84", Colors.purple, "lib/images/StrawbeerySmoothie.png"],
    ["Mango", "95", Colors.brown, "lib/images/MangoSmoothie1.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: donutsOnSale.length,
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.5),
        itemBuilder: (context, index) {
          // Parse the price as double safely
          double price = 0.0;
          try {
            price = double.parse(donutsOnSale[index][1]);
          } catch (e) {
            print("Error parsing price: ${donutsOnSale[index][1]}");
          }

          return DonutTile(
            donutFlavor: donutsOnSale[index][0],
            donutPrice: price, // Use parsed price
            donutColor: donutsOnSale[index][2],
            imageName: donutsOnSale[index][3],
            donutStore: '',
            onAddToCart: () => onAddToCart(price), // Pass price here
          );
        });
  }
}
