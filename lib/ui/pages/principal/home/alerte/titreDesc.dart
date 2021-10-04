import 'package:flutter/material.dart';
import 'package:hustler/constants.dart';
import 'package:hustler/ui/pages/principal/home/alerte/creation/creationViewModel.dart';
import 'package:hustler/ui/pages/principal/home/alerte/lieuPrix.dart';
import 'package:hustler/ui/pages/principal/menu.dart';
import 'package:stacked/stacked.dart';

class TitreDescAlerte extends StatelessWidget {
  const TitreDescAlerte({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String id = ModalRoute.of(context)?.settings.arguments as String;
    AlerteCreationViewModel alerteCreationViewModel =
        new AlerteCreationViewModel();
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
                              "Choisissez un type de service correspondant à votre annonce",
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
                            value:
                                model.service.isNotEmpty ? model.service : null,
                            onChanged: (String? newChoix) {
                              model.setState(newChoix);
                            },
                            items: model.listItem.map((valeur) {
                              return DropdownMenuItem<String>(
                                value: valeur,
                                child: Container(child: Text(valeur)),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                          child: Text("Donner un titre à votre annonce",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                          child: Text("Exemple : Démenagement , Aide maçon ..",
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
                                TextEditingController(text: model.titre),
                            onChanged: (value) {
                              model.titre = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Donner un titre a votre annonce';
                              } else if (value.length < 12) {
                                return 'Au minimum 12 caractères ';
                              }
                            },
                            maxLines: null,
                            decoration: InputDecoration(
                                hintText: "Titre",
                                labelText: "Choisissez un titre simple",
                                labelStyle: TextStyle(fontFamily: familyFont)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                          child: Text("Détaillez votre annonce",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                          child: Text(
                              "Décrivez ce dont vous avez besoin afin de recevoir des offres adaptés à votre budget.",
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
                                TextEditingController(text: model.message),
                            onChanged: (value) {
                              model.message = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Donner un titre a votre annonce';
                              } else if (value.length < 45) {
                                return 'Encore quelques mots ';
                              }
                            },
                            maxLines: null,
                            decoration: InputDecoration(
                                hintText: "Description",
                                labelText: "Description ",
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
                        print('choix : ${model.service.toString()}');
                        if (model.service.isNotEmpty &&
                            model.formKey.currentState!.validate()) {
                          alerteCreationViewModel.alerteurId = id.toString();
                          alerteCreationViewModel.titre = model.titre;
                          alerteCreationViewModel.message = model.message;
                          alerteCreationViewModel.service = model.service;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LieuPrix(),
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
