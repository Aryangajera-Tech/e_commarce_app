import 'package:e_commarce_app/sign%20in/Sign%20in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class userdata extends StatefulWidget {
  const userdata({Key? key}) : super(key: key);

  @override
  State<userdata> createState() => _userdataState();
}

class _userdataState extends State<userdata> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            height: h,
            width: w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 20.0,
                        ),
                      ]),
                  height: h / 4,
                  width: w - 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.grey,
                          maxRadius: 50,
                          child: ClipOval(
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(45),
                              child: Image.network(user!.photoURL.toString()),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        user!.displayName.toString(),
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                Container(
                  height: h / 1.50,
                  width: w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 20.0,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name :",
                              style: GoogleFonts.akshar(fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 45,
                                width: w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    user!.displayName.toString(),
                                    style: GoogleFonts.akshar(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Divider(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Email :",
                              style: GoogleFonts.akshar(fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 45,
                                width: w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    user!.email.toString(),
                                    style: GoogleFonts.akshar(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Divider(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Phone :",
                              style: GoogleFonts.akshar(fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 45,
                                width: w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    user!.phoneNumber.toString(),
                                    style: GoogleFonts.akshar(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Divider(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Last login:",
                              style: GoogleFonts.akshar(fontSize: 20),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 45,
                                    width: w / 2.5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black12),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            (user!.metadata.creationTime!.day)
                                                .toString(),
                                            style: GoogleFonts.akshar(
                                                fontSize: 20),
                                          ),
                                          Text(
                                            " - ",
                                            style: GoogleFonts.akshar(
                                                fontSize: 20),
                                          ),
                                          Text(
                                            (user!.metadata.creationTime!.month)
                                                .toString(),
                                            style: GoogleFonts.akshar(
                                                fontSize: 20),
                                          ),
                                          Text(
                                            " - ",
                                            style: GoogleFonts.akshar(
                                                fontSize: 20),
                                          ),
                                          Text(
                                            (user!.metadata.creationTime!.year)
                                                .toString(),
                                            style: GoogleFonts.akshar(
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 45,
                                    width: w / 3.1,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black12),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            (user!.metadata.creationTime!.hour)
                                                .toString(),
                                            style: GoogleFonts.akshar(
                                                fontSize: 20),
                                          ),
                                          Text(
                                            " : ",
                                            style: GoogleFonts.akshar(
                                                fontSize: 20),
                                          ),
                                          Text(
                                            (user!.metadata.creationTime!
                                                    .minute)
                                                .toString(),
                                            style: GoogleFonts.akshar(
                                                fontSize: 20),
                                          ),
                                          Text(
                                            " : ",
                                            style: GoogleFonts.akshar(
                                                fontSize: 20),
                                          ),
                                          Text(
                                            (user!.metadata.creationTime!
                                                    .second)
                                                .toString(),
                                            style: GoogleFonts.akshar(
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Divider(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Text("User Name"),
              ],
            ),
          ),
        ));
  }
}
