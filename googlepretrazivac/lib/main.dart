import 'dart:async';

import 'package:flutter/material.dart';
import 'package:googlepretrazivac/secondpage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'SizeConfig.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft, child: secondPage())));

    return Scaffold(
      appBar: AppBar(
        title: Text("Image from assets"),
      ),
      body: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.5,
            width: SizeConfig.screenWidth * 1,
            color: Colors.blue,
            child: Center(
              child: Image.asset('assets/images/google.png'), //   <-- image
            ),
          ),
        ],
      ),

      //provjerim je li user null, ako nije null idem na timer. ovdje uradim onpressed login
    );
  }
}
