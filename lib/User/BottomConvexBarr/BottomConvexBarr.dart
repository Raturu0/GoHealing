import "package:flutter/material.dart";
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:gohealing/User/pages/Home/HomePage.dart';
import 'package:gohealing/User/pages/Keranjang/KeranjangPage.dart';
import 'package:gohealing/User/pages/ListWisataPage.dart';
import 'package:gohealing/User/pages/Historyy/HistoryPage.dart';
import 'package:gohealing/User/pages/ProfilePage/ProfilePage.dart';
import 'package:gohealing/User/pages/Souvenir/ListSouvenirPage.dart';

class BottomConvexBarr extends StatefulWidget {
  const BottomConvexBarr({super.key});

  @override
  State<BottomConvexBarr> createState() => _BottomConvexBarrState();
}

class _BottomConvexBarrState extends State<BottomConvexBarr> {
  int currIndex = 2;

  @override
  List<Widget> widgets = [
    ListSouvenirPage(),
    ListWisataPage(),
    HomePage(),
    KeranjangPage(),
    ProfilePage()
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        body: widgets[currIndex],
        bottomNavigationBar: Container(
          child: ConvexAppBar(
            initialActiveIndex: currIndex,
            backgroundColor: Color(0xFF18227B),
            height: 70,
            color: Colors.white,
            items: [
              TabItem(icon: Icons.card_giftcard_rounded, title: 'Souvenir'),
              TabItem(icon: Icons.search, title: 'Wisata'),
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.shopping_cart, title: 'Cart'),
              TabItem(icon: Icons.person, title: 'Profile'),
            ],
            onTap: (int i) {
              setState(() {
                print("sekarang di = $i");
                currIndex = i;
              });
            },
          ),
        ));
  }
}
