import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:store/fav.dart';
import 'package:store/home.dart';
import 'package:store/cart.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _PageState();
}

class _PageState extends State<MainPage> {
  List pages = [
    const Fav(),
    const Home(),
    const Cart(),
  ];

  int _selectedItemPosition = 1;
  SnakeShape snakeShape = SnakeShape.rectangle;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: pages.elementAt(_selectedItemPosition),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        elevation: 5,
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: snakeShape,
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            side: BorderSide(color: Theme.of(context).primaryColor, width: 3)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

        snakeViewColor: Theme.of(context).primaryColor,
        selectedItemColor:
        snakeShape == SnakeShape.indicator ? Theme.of(context).primaryColor : null,
        unselectedItemColor: Colors.grey[600],

        showUnselectedLabels: false,
        showSelectedLabels: true,

        currentIndex: _selectedItemPosition,
        onTap: (value) => setState(() => _selectedItemPosition = value),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, size: 30), label: 'Favorite'),

          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: 'Home'),

          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 30), label: 'Cart')
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}