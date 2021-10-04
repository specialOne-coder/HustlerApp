import 'package:flutter/material.dart';
import 'package:hustler/ui/pages/principal/home/alerte/creation/creationViewModel.dart';
import 'package:hustler/ui/pages/principal/home/alerte/photo.dart';
import 'package:hustler/ui/pages/principal/menu.dart';
import 'package:stacked/stacked.dart';

import '../../../../../constants.dart';

class LieuPrix extends StatelessWidget {
  const LieuPrix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AlerteCreationViewModel alerteCreationViewModel =
        new AlerteCreationViewModel();
    AlerteCreationViewModel alerte =
        ModalRoute.of(context)?.settings.arguments as AlerteCreationViewModel;
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<AlerteCreationViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Menu()));
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Form(
                  key: model.formKey,
                  autovalidateMode: AutovalidateMode.always,
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
                              Text("Publier une annonce",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 8.0),
                                child: Text(
                                    "Publier votre annonce en quelques étapes",
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
                            width: size.width * 0.48,
                            height: 3,
                            color: Colors.pink),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
                          child: Text("Lieu d'intervention",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                          child: Text(
                              "Ou l'intervention doit elle se réaliser ?",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300)),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            controller:
                                TextEditingController(text: model.position),
                            onChanged: (value) {
                              model.position = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Entrer votre emplacement';
                              } else if (value.length < 5) {
                                return 'Au minimum 5 caractères ';
                              }
                            },
                            maxLines: null,
                            decoration: InputDecoration(
                                hintText: "Lieu",
                                labelText: "Lieu d'intervention",
                                labelStyle: TextStyle(fontFamily: familyFont)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                          child: Text("Votre prix",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                          child: Text(
                              "Choisissez un prix pour la réalisation de votre annonce , soyez réaliste",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300)),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 9,
                            onChanged: (value) {
                              model.prix = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Donner un prix a votre annonce';
                              }
                            },
                            maxLines: null,
                            decoration: InputDecoration(
                                hintText: "Prix",
                                labelText: "Prix de l'annonce ",
                                labelStyle: TextStyle(fontFamily: familyFont)),
                          ),
                        ),
                      ],
                    ),
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
                        print('model : ${alerte.service.toString()}');
                        if (model.formKey.currentState!.validate()) {
                          alerteCreationViewModel.alerteurId =
                              alerte.alerteurId;
                          alerteCreationViewModel.titre = alerte.titre;
                          alerteCreationViewModel.message = alerte.message;
                          alerteCreationViewModel.service = alerte.service;
                          alerteCreationViewModel.position = model.position;
                          alerteCreationViewModel.prix = model.prix;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhotoChoicePage(),
                                  settings: RouteSettings(
                                      arguments: alerteCreationViewModel)));
                        }
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
            ),
        viewModelBuilder: () => AlerteCreationViewModel());
  }
}
