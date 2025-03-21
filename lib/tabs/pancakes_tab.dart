import 'package:donut_app_2a_martinez/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class PancakesTab extends StatelessWidget {
  final Function(double) onAddToCart;

  PancakesTab({required this.onAddToCart});

  final List donutsOnSale = [
    [
      "Ice Cream Pancake",
      "36",
      Colors.blue,
      "lib/images/purepng.com-pancakepancakehotcakegriddlecakeflapjack-1411528648897qeapn.png"
    ],
    [
      "Strawberry Pancake",
      "45",
      Colors.red,
      "lib/images/pngimg.com - pancake_PNG99.png"
    ],
    [
      "Pancake Grape",
      "50",
      Colors.purple,
      "lib/images/pngimg.com - pancake_PNG108.png"
    ],
    [
      "Choco Pancake",
      "80",
      Colors.brown,
      "lib/images/pngimg.com - pancake_PNG116.png"
    ],
    [
      "Skibidi Pancake",
      "36",
      Colors.blue,
      "lib/images/pngimg.com - pancake_PNG120.png"
    ],
    [
      "Plain Pancake",
      "15",
      Colors.red,
      "lib/images/pngtree-strawberry-pancakes-png-png-image_11598617.png"
    ],
    [
      "Pancake with some cheese",
      "25",
      Colors.purple,
      "lib/images/Noshu-PancakeMix-LC-Hero-750px.png"
    ],
    [
      "Soft Pancake",
      "10",
      Colors.brown,
      "lib/images/pancake-with-ai-generated-free-png.png"
    ],
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
      },
    );
  }
}
