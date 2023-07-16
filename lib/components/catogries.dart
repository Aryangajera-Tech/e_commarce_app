import 'package:e_commarce_app/components/electricproduct.dart';
import 'package:e_commarce_app/components/electronicsproduct.dart';
import 'package:e_commarce_app/components/fashionproduct.dart';
import 'package:e_commarce_app/components/furnictureproduct.dart';
import 'package:e_commarce_app/components/kitchenproduct.dart';
import 'package:e_commarce_app/electricpro.dart';
import 'package:flutter/material.dart';

class catagories extends StatelessWidget {
  const catagories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => electronics()));
                  },
                  child: Image.asset(
                    'assets/images/smartphone.png',
                    height: 50,
                    width: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'phone',
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 25,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => fashion()));
                  },
                  child: Image.asset(
                    'assets/images/clothes-rack.png',
                    height: 50,
                    width: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Fashion',
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 25,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => electrics()));
                  },
                  child: Image.asset(
                    'assets/images/electronics (1).png',
                    height: 50,
                    width: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Electronic',
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 25,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => kitchens()));
                  },
                  child: Image.asset(
                    'assets/images/kitchen (1).png',
                    height: 50,
                    width: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Tupperware',
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 25,
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/personal-care.png',
                  height: 50,
                  width: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Cosmatic',
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 25,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => furnictures()));
                  },
                  child: Image.asset(
                    'assets/images/furnitures.png',
                    height: 50,
                    width: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Furnicture',
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
