import 'package:flutter/material.dart';
import 'package:hustler/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        color: Colors.white,
        child: Center(
          child: Text(
            'Hustler',
            style: TextStyle(color: kPrimaryColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
