import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NothingNot extends StatefulWidget {
  const NothingNot({Key? key}) : super(key: key);

  @override
  _NothingNotState createState() => _NothingNotState();
}

class _NothingNotState extends State<NothingNot> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.sentiment_satisfied,
          textDirection: TextDirection.ltr,
          color: Colors.grey[350],
          size: size.height * 0.18,
        ),
        Text(
          'Aucune notification',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Text(
            "Vous n'avez aucune notification , du moins pour l'instant",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(),
          ),
        ),
      ],
    );
  }
}
