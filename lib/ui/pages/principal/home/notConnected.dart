import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hustler/constants.dart';

class NotConnected extends StatelessWidget {
  const NotConnected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.sentiment_dissatisfied,
          textDirection: TextDirection.ltr,
          color: kPrimaryColor,
          size: size.height * 0.18,
        ),
        Text(
          'Not connected',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Text(
            "",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(),
          ),
        ),
      ],
    );
  }
}
