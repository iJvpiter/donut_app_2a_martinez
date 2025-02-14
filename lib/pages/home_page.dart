import 'package:donut_app_2a_martinez/tabs/burger_tab.dart';
import 'package:donut_app_2a_martinez/tabs/donut_tab.dart';
import 'package:donut_app_2a_martinez/tabs/pancakes_tab.dart';
import 'package:donut_app_2a_martinez/tabs/pizza_tab.dart';
import 'package:donut_app_2a_martinez/tabs/smoothie_tab.dart';
import 'package:donut_app_2a_martinez/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    // Donut Tab
    MyTab(iconPath: 'lib/icons/donut.png'),
    // Burger Tab
    MyTab(iconPath: 'lib/icons/burger.png'),
    // Smoothie Tab
    MyTab(iconPath: 'lib/icons/smoothie.png'),
    // Pancake Tab
    MyTab(iconPath: 'lib/icons/pancakes.png'),
    // Pizza tab
    MyTab(iconPath: 'lib/icons/pizza.png'),
  ];

  @override
  Widget build(BuildContext context) {
    // Widget para gestionar
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            //ícono de la izquierda
            leading: Icon(
              Icons.menu,
              color: Colors.grey[800],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
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
                    Text(
                      "I want to ",
                      style: TextStyle(fontSize: 32),
                    ),
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
              //Tab bar (Pestañas)
              TabBar(tabs: myTabs),
              //Tab bar view (Contenido de pestañas)
              Expanded(
                  child: TabBarView(
                children: [
                  DonutTab(),
                  BurgerTab(),
                  SmoothieTab(),
                  PancakesTab(),
                  PizzaTab(),
                ],
              ))

              //Carrito
            ],
          )),
    );
  }
}
