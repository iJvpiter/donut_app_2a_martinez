import 'package:donut_app_2a_martinez/tabs/burger_tab.dart';
import 'package:donut_app_2a_martinez/tabs/donut_tab.dart';
import 'package:donut_app_2a_martinez/tabs/pancakes_tab.dart';
import 'package:donut_app_2a_martinez/tabs/pizza_tab.dart';
import 'package:donut_app_2a_martinez/tabs/smoothie_tab.dart';
import 'package:donut_app_2a_martinez/utils/my_tab.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    //Donut tab
    MyTab(iconPath: 'lib/icons/donut.png'),
    //Burger tab
    MyTab(iconPath: 'lib/icons/burger.png'),
    //Smoothie tab
    MyTab(iconPath: 'lib/icons/smoothie.png'),
    //Pancake tab
    MyTab(iconPath: 'lib/icons/pancakes.png'),
    //Pizza tab
    MyTab(iconPath: 'lib/icons/pizza.png'),
  ];

  int totalItems = 0;
  double totalPrice = 0.0;

  void addToCart(double price) {
    setState(() {
      totalItems++;
      totalPrice += price;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Este widget sirve para gestionar las pestañas
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            //Icono de la izquierda
            leading: Icon(
              Icons.menu,
              color: Colors.grey[800],
            ),
            actions: [
              const Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: Icon(Icons.person),
              )
            ],
          ),
          body: Column(
            children: [
              //Texto "I want to eat"
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                child: Row(
                  children: [
                    const Text("I want to ", style: TextStyle(fontSize: 32)),
                    Text(
                      "Eat",
                      style: TextStyle(
                          //Tamaño de letra
                          fontSize: 32,
                          //Negritas
                          fontWeight: FontWeight.bold,
                          //Subrayado
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
              //Tab bar(Pestañas)
              TabBar(tabs: myTabs),
              //Tab bar View(Contenido de pestañas)
              Expanded(
                  child: TabBarView(
                children: [
                  DonutTab(onAddToCart: addToCart),
                  BurgerTab(onAddToCart: addToCart),
                  SmoothieTab(onAddToCart: addToCart),
                  PancakesTab(onAddToCart: addToCart),
                  PizzaTab(onAddToCart: addToCart),
                ],
              )),
              // Carrito
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: Column(
                        //Alinear a la izquierda (horizontal)
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$totalItems Items | \$${totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Delivery Charges Included',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12)),
                        child: const Text('View Cart',
                            style: TextStyle(color: Colors.white))),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
