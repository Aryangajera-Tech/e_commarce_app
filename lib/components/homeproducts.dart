import 'package:e_commarce_app/Home%20page/likepage.dart';
import 'package:e_commarce_app/components/detailscreen.dart';
import 'package:e_commarce_app/homepagepro.dart';
import 'package:e_commarce_app/models/clipper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homeproducts extends StatefulWidget {
  const homeproducts({Key? key}) : super(key: key);
  @override
  State<homeproducts> createState() => _homeproductsState();
}

class _homeproductsState extends State<homeproducts> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    bool likedata = true;

    return Scaffold(
      body: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (w - 112) / (2 * 270),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: homeproduct.length,
        itemBuilder: (_, index) {
          if (index % 2 == 0) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) =>
                      DetailScreen(popularproduct: homeproduct[index])),
                ),
              ),
              child: OverflowBox(
                maxHeight: 291.0 + 73.0,
                child: Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(blurRadius: 20, color: Colors.grey.shade200)
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipPath(
                          clipper: MyClipper(),
                          child: Container(
                            height: 175,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          homeproduct[index].picture),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                homeproduct[index].title,
                                style: GoogleFonts.nunito(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '\$${homeproduct[index].price}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '.00',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: w / 4,
                                height: h / 24,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    'Buy Now',
                                    style: TextStyle(
                                        fontSize: h / 65,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: InkWell(
                                  child: likedata
                                      ? Icon(
                                          Icons.favorite_border,
                                        )
                                      : Icon(
                                          Icons.favorite,
                                          color: Colors.pink,
                                        ),
                                  onTap: () {
                                    setState(() {
                                      likedata = !likedata;
                                      if (likedata == false) {
                                        likeimage
                                            .add(homeproduct[index].picture);
                                        likename.add(homeproduct[index].title);
                                        likeprice.add(homeproduct[index].price);
                                      }
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) =>
                    DetailScreen(popularproduct: homeproduct[index])),
              ),
            ),
            child: OverflowBox(
              maxHeight: 291.0 + 73.0,
              child: Container(
                margin: EdgeInsets.only(top: 60),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(blurRadius: 5, color: Colors.grey.shade200)
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          height: 164,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image:
                                        AssetImage(homeproduct[index].picture),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              homeproduct[index].title,
                              style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$${homeproduct[index].price}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Text(
                                  '.00',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: w / 4,
                              height: h / 24,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  'Buy Now',
                                  style: TextStyle(
                                      fontSize: h / 65,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: GestureDetector(
                                child: likedata
                                    ? Icon(
                                        Icons.favorite_border,
                                      )
                                    : Icon(
                                        Icons.favorite,
                                        color: Colors.pink,
                                      ),
                                onTap: () {
                                  setState(() {
                                    likedata = !likedata;
                                    if (likedata == false) {
                                      likeimage.add(homeproduct[index].picture);
                                      likename.add(homeproduct[index].title);
                                      likeprice.add(homeproduct[index].price);
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
