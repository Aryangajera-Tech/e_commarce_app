import 'dart:io';
import 'package:e_commarce_app/Home%20page/cart.dart';
import 'package:e_commarce_app/Home%20page/likepage.dart';
import 'package:flutter/material.dart';
import 'package:e_commarce_app/models/popularmodel.dart';
import 'package:e_commarce_app/models/clipper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class DetailScreen extends StatefulWidget {
  final PopularModel popularproduct;

  const DetailScreen({
    Key? key,
    required this.popularproduct,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int qty = 1;
  bool cartdata = true;
  bool likedata = true;
  bool like = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: ClipPath(
              clipper: MyClipper(),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.popularproduct.picture),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 15,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 15,
                        child: Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 00),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.popularproduct.title,
                        style: GoogleFonts.nunito(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 00, 8, 00),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '\$${widget.popularproduct.price * qty}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                          const Text(
                            '.00',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              if (qty > 1) {
                                qty--;
                              }
                              setState(() {});
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 12,
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              qty.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          InkWell(
                            child: const CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 12,
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                            onTap: () {
                              qty++;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/flower.jpg'),
                  fit: BoxFit.cover,
                ),
                boxShadow: const [
                  BoxShadow(color: Colors.grey, blurRadius: 8),
                ],
              ),
            ),
            title: Row(
              children: [
                const Text(
                  'Flower Store',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            subtitle: const Text('Official Store'),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: FittedBox(
                child: Row(
                  children: [
                    Icon(
                      Icons.share,
                      color: Colors.black,
                      size: 16,
                    ),
                    SizedBox(width: 5),
                    Container(
                      child: InkWell(
                        onTap: (() async {
                          final bytes = await rootBundle
                              .load(widget.popularproduct.picture);
                          final list = bytes.buffer.asUint8List();

                          final tempDir = await getTemporaryDirectory();
                          final file =
                              await File('${tempDir.path}/image.jpg').create();
                          file.writeAsBytesSync(list);
                          Share.shareFiles(['${file.path}'],
                              text: 'Take a look at this ' +
                                  '*' +
                                  widget.popularproduct.title +
                                  '*' +
                                  '\n just at *\$' +
                                  '${widget.popularproduct.price}*' +
                                  '\nBuy at Happy shoping');
                        }),
                        child: Text('share'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              widget.popularproduct.desc,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Container(
          height: 60,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(20)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () {
                setState(() {
                  cartdata = !cartdata;
                  if (cartdata == false) {
                    cartimage.add(widget.popularproduct.picture);
                    cartname.add(widget.popularproduct.title);
                    cartprice.add(widget.popularproduct.price);
                    productqty.add(qty);
                  }
                });
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(child: Icon(Icons.shopping_cart_outlined)),
              ),
            ),
            GestureDetector(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
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
                        likeimage.add(widget.popularproduct.picture);
                        likename.add(widget.popularproduct.title);
                        likeprice.add(widget.popularproduct.price);
                      }
                    });
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width - 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                    child: Text(
                  'order now',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
