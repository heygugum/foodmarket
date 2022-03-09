// ignore_for_file: prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:foodmarket/Pages/cart.dart';
import 'package:foodmarket/Pages/favorit.dart';
import 'package:foodmarket/Pages/home.dart';
import 'package:foodmarket/Pages/profil.dart';
import 'package:foodmarket/Pages/search.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_label
    final items = <Widget>[
      Icon(Icons.home,
          color: index == 0 ? Colors.white : Colors.black, size: 30),
      Icon(Icons.search,
          color: index == 1 ? Colors.white : Colors.black, size: 30),
      Icon(Icons.favorite, color: Colors.white, size: 30),
      Icon(Icons.card_travel_sharp, color: Colors.white, size: 30),
      Icon(Icons.perm_identity, color: Colors.white, size: 30),
    ];

    final pages = [
      HomePage(),
      SearchPage(),
      FavoritPage(),
      CartPage(),
      ProfilPage(),
    ];

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.grey,
        buttonBackgroundColor: Colors.red,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 200),
        index: index,
        items: [
          items[0],
          items[1],
          items[2],
          items[3],
          items[4],
        ],
        key: navigationKey,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: pages[index],
    );
  }
}
