import 'package:flutter/material.dart';
import 'package:e_commarce_app/components/account_details.dart';
import 'package:e_commarce_app/components/catogries.dart';
import 'package:e_commarce_app/components/feednews.dart';
import 'package:e_commarce_app/components/homeproducts.dart';

class recenthome extends StatefulWidget {
  const recenthome({Key? key}) : super(key: key);

  @override
  State<recenthome> createState() => _recenthomeState();
}

class _recenthomeState extends State<recenthome> {
  GlobalKey<ScaffoldState> _drawerpage = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _drawerpage,
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset("assets/images/logo.png")),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => userdata()));
              },
              title: const Text(
                'My Account',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
            ),
            Divider(
              height: 2,
              color: Color(0xffffecd2),
            ),
            ListTile(
              title: const Text(
                'My orders',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            Divider(
              height: 2,
              color: Color(0xffffecd2),
            ),
            ListTile(
              title: const Text(
                'My wishlist',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            Divider(
              height: 2,
              color: Color(0xffffecd2),
            ),
            ListTile(
              title: const Text(
                'My Reviews',
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.mail_sharp,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            Divider(
              height: 2,
              color: Color(0xffffecd2),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: w / 7.5,
                      height: h / 15,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.menu_rounded, color: Colors.white),
                        onPressed: () => _drawerpage.currentState!.openDrawer(),
                      ),
                    ),
                    Container(
                      width: w / 1.55,
                      height: h / 15,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            hintText: 'Search your product',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: w / 7.5,
                      height: h / 15,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  primary: false,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Category',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        catagories(),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Popular product',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        feednews(),
                        Container(
                          height: 2.5 * h - MediaQuery.of(context).padding.top,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: homeproducts(),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(color: Colors.white),
        ),
      ),
    );
  }
}
