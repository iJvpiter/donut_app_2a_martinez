import 'package:donut_app_2a_martinez/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  final Function(double) onAddToCart;

  PizzaTab({required this.onAddToCart});

  final List donutsOnSale = [
    ["Pizza (simple)", "36", Colors.blue, "lib/images/pizza1.png"],
    ["Double Cheese", "45", Colors.red, "lib/images/pizza2.png"],
    ["Mixed Meats", "84", Colors.purple, "lib/images/pizza3.png"],
    ["Vegan Pizza", "95", Colors.brown, "lib/images/pizza4.png"],
    ["Small Pizza", "36", Colors.blue, "lib/images/pizza5.png"],
    ["Cheesy Crust", "45", Colors.red, "lib/images/pizza6.png"],
    ["Meat Lovers", "84", Colors.purple, "lib/images/pizza7.png"],
    ["Veggie Pizza", "95", Colors.brown, "lib/images/pizza8.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: donutsOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        double price = double.parse(donutsOnSale[index][1]);

        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutPrice: price, // ← now correct type (double)
          donutColor: donutsOnSale[index][2],
          imageName: donutsOnSale[index][3],
          donutStore: '',
          onAddToCart: () => onAddToCart(price),
        );
      },
    );
  }
}
