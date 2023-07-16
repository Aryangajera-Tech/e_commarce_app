import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commarce_app/Home%20page/cart.dart';
import 'package:e_commarce_app/Home%20page/likepage.dart';
import 'package:e_commarce_app/Home%20page/recenthome.dart';
import 'package:flutter/material.dart';

var a = cartimage.length;

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  var page = [recenthome(), CartPage(), LikePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[index],
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 60.0,
        items: [
          Icon(Icons.home_filled, color: Colors.white, size: 30),
          Icon(Icons.shopping_bag, color: Colors.white, size: 30),
          Icon(Icons.favorite, color: Colors.white, size: 30),
        ],
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int newIndex) {
          setState(() {
            index = newIndex;
          });
        },
      ),
    );
  }
}
