import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List cartimage = [];
List cartname = [];
List<int> cartprice = <int>[];
List<int> productqty = <int>[];

int total = 0;

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    cartprice.forEach((element) {
      total = total + element;
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "CART",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: cartimage.length,
                  itemBuilder: (context, index) => Container(
                        height: 120,
                        margin: EdgeInsets.only(bottom: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 2)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: AssetImage(cartimage[index]),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    width: 150,
                                    child: Container(
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartname[index],
                                            style: GoogleFonts.nunito(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            "\$${cartprice[index] * productqty[index]}",
                                            style: GoogleFonts.nunito(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (productqty[index] > 1) {
                                              setState(() {
                                                productqty[index]--;
                                                total -= cartprice[index];
                                              });
                                            }
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            productqty[index].toString(),
                                            style:
                                                const TextStyle(fontSize: 20),
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
                                            setState(() {
                                              productqty[index]++;
                                              var abc = cartprice[index] *
                                                  productqty[index];
                                              total += abc;
                                              print(total);
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, left: 15),
                                  child: InkWell(
                                    child: Icon(Icons.delete),
                                    onTap: () {
                                      cartname.remove(cartname[index]);
                                      cartprice.remove(cartprice[index]);
                                      cartimage.remove(cartimage[index]);
                                      productqty.remove(productqty[index]);
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                width: w,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 20,
                                    color: Colors.black),
                              ),
                              Expanded(child: Divider()),
                              Text(
                                '\$${total.toString()}',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
