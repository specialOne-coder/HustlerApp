import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hustler/ui/pages/principal/profil/competences/competenceViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../constants.dart';

class CompetencePage extends StatelessWidget {
  const CompetencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  'Compétences',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: kPrimaryColor,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  height: size.height,
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Center(
                        heightFactor: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.sentiment_dissatisfied_rounded,
                              textDirection: TextDirection.ltr,
                              color: Colors.grey[350],
                              size: size.height * 0.18,
                            ),
                            Text(
                              'Aucune compétence',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 15),
                              child: Text(
                                "les compétences vous seront assignés en fonction de vos travaux réalisés",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => CompetenceViewModel());
  }
}
