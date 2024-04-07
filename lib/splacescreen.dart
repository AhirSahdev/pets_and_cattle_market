import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'languagepage.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  static const String KEYLOGIN = "login";
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: 400,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff89f7fe),
          Color(0xff66a6ff),
        ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Pet Salling Logo.png', height: 200),
            const Text(
              'PET CART',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ));
  }

  void whereToGo() async {

    var sharedPref = await SharedPreferences.getInstance();
    
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(const Duration(seconds: 5), () {

      if(isLoggedIn!=null){
        if(isLoggedIn){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LanguageSelectionPage(),
              ));
        }
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LanguageSelectionPage(),
            ));
      }


    });
  }
}
