import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Nothing extends StatefulWidget {
  const Nothing({Key? key}) : super(key: key);

  @override
  _NothingState createState() => _NothingState();
}

class _NothingState extends State<Nothing> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.sentiment_dissatisfied_rounded,
          textDirection: TextDirection.ltr,
          color: Colors.grey[350],
          size: size.height * 0.18,
        ),
        Text(
          'Aucune mission',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Text(
            "Rendez-vous sur la page d'accueil pour trouver votre prochain job",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(),
          ),
        ),
      ],
    );
  }
}
