import 'package:flutter/material.dart';
import 'package:hustler/ui/pages/principal/home/postAgent/creation2.dart';

import '../../../../../constants.dart';
import '../../menu.dart';

class Creation1 extends StatefulWidget {
  const Creation1({Key? key}) : super(key: key);

  @override
  _Creation1State createState() => _Creation1State();
}

class _Creation1State extends State<Creation1> {
  @override
  Widget build(BuildContext context) {
    late String choix = "";
    List listItem = [
      "Informatique",
      "Travaux domiciles",
      "Plomberie",
      "Menuserie",
      "Mecanicien",
      "..."
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Menu()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, right: 10),
                color: kPrimaryColor,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Promouvoir ses services",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                      child: Text("Promouvez vos services en quelques étapes",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: size.width * 0.32,
                  height: 3,
                  color: Colors.pink),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                child: Text("De quel type de service sagit-il ?",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Text(
                    "Choisissez un type de service correspondant à votre activité",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w300)),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                child: DropdownButton<String>(
                  hint: Text('Type de service'),
                  //dropdownColor: kPrimaryColor,
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                  iconSize: 25,

                  underline: Container(
                    height: 1,
                    color: Colors.grey[400],
                  ),
                  isExpanded: true,
                  value: choix.isNotEmpty ? choix : null,
                  onChanged: (String? newChoix) {
                    setState(() {
                      choix = newChoix!;
                    });
                  },
                  items: listItem.map((valeur) {
                    return DropdownMenuItem<String>(
                      value: valeur,
                      child: Container(child: Text(valeur)),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                child: Text("Détaillez votre activité",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Text("Décrivez en quelques lignes votre activité",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w300)),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: "Description",
                      labelText: "Description ",
                      labelStyle: TextStyle(fontFamily: familyFont)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
                child: Text("Votre adresse",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Text("L'adresse à laquelle vous operez",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w300)),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: "Adresse",
                      labelText: "Adresse",
                      labelStyle: TextStyle(fontFamily: familyFont)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
              size: 25,
            ),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, right: 15),
            padding: EdgeInsets.symmetric(vertical: 0.01),
            width: size.width * 0.4,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: kPrimaryColor),
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Creation2()));
              },
              child: Text(
                'Continuer',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
