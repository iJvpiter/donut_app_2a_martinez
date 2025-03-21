import 'package:flutter/material.dart';
import 'package:donut_app_2a_martinez/utils/donut_tile.dart';

class BurgerTab extends StatelessWidget {
  final Function(double) onAddToCart;

  BurgerTab({required this.onAddToCart});

  final List donutsOnSale = [
    // [ donutFlavor, donutPrice, donutColor, imageName ]
    ["Fortnite Burger", "40", Colors.blue, "lib/images/FortniteBurger.png"],
    ["Big burger", "45", Colors.red, "lib/images/Burger1.png"],
    ["Suspicous Burger", "84", Colors.purple, "lib/images/Burger2.png"],
    ["Nice Burger", "95", Colors.brown, "lib/images/Burger3.png"],
    ["Skibidi Burger", "36", Colors.blue, "lib/images/Burger4.png"],
    ["The Burger", "45", Colors.red, "lib/images/Burger5.png"],
    ["Torta de invencible", "84", Colors.purple, "lib/images/Burger6.png"],
    ["Plain Burger", "95", Colors.brown, "lib/images/Cheeseburger.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: donutsOnSale.length,
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.5),
        itemBuilder: (context, index) {
          // Cálculo de precio para evitar errores
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
