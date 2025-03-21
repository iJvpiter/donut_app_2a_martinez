import 'package:flutter/material.dart';

class PizzaTile extends StatelessWidget {
  final String donutFlavor;
  final double donutPrice; // Ahora es double en lugar de String
  final dynamic
      donutColor; // dynamic porque será de tipo Color y también usará []
  final String imageName;
  final String donutStore;
  final VoidCallback onAddToCart; // Nueva función para añadir al carrito

  const PizzaTile({
    super.key,
    required this.donutFlavor,
    required this.donutPrice,
    required this.donutColor,
    required this.imageName,
    required this.donutStore,
    required this.onAddToCart, // Se agrega este parámetro
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: donutColor[50], borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            // Price Tag
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: donutColor[100],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: Text(
                    '\$${donutPrice.toStringAsFixed(2)}', // Muestra 2 decimales
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: donutColor[800]),
                  ),
                ),
              ],
            ),

            // Donut Picture
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
              child: Image.asset(imageName),
            ),

            // Donut Flavor
            Text(donutFlavor,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),

            // Love icon + add button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite_border),
                  GestureDetector(
                    onTap:
                        onAddToCart, // Llama a la función al presionar el botón
                    child: Icon(Icons.add, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 4),
            Text(donutStore, style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}
