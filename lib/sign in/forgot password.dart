import 'package:e_commarce_app/sign%20in/Sign%20in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class forgotpass extends StatefulWidget {
  const forgotpass({Key? key}) : super(key: key);

  @override
  State<forgotpass> createState() => _forgotpassState();
}

class _forgotpassState extends State<forgotpass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height:240,
              child: Image.asset(
                  'assets/images/logo2.jpg',
                  fit: BoxFit.fill),
            ),
            Container(
                      height: MediaQuery.of(context).size.height - 260,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              height: 3,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.black),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(30,7, 00, 20),
                                child: Text(
                                  'Forgot password',
                                  style: GoogleFonts.playfairDisplay(
                                      fontSize: 30, fontWeight: FontWeight.w900),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(30, 10, 30, 00),
                                child: Text('Email',
                                    style: GoogleFonts.nunito(
                                        fontSize: 20, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 00, 30, 30),
                            child: TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: ('Your Email-id'),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                hintStyle:
                                TextStyle(color: Colors.brown, fontSize: 15),

                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width:MediaQuery.of(context).size.width-80,
                            alignment: Alignment.center,
                            child:  InkWell(
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder:(context) => Signin(),));
                                },
                                child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
                          ),
                          InkWell(
                              onTap: (){
                                Navigator.push(context,MaterialPageRoute(builder:(context) => Signin(),));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text('Back to login',style: TextStyle(fontSize: 15,color: Colors.grey),),
                              ))
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
