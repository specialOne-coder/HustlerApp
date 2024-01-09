import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hustler/ui/pages/principal/profil/informations/informationsViewModel.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../constants.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List? infos = ModalRoute.of(context)!.settings.arguments as List;
    return ViewModelBuilder<InformationsViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  'Mot de passe',
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
                  child: Form(
                    key: model.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              model.password = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Entrer votre ancien mot de passe ';
                              } else if (value.length < 8) {
                                return 'Minimum 8 caractères';
                              }
                              return null;
                            },
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: null,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                hintText: "Mot de passe actuel ",
                                labelText: "Mot de passe actuel ",
                                labelStyle: TextStyle(fontFamily: familyFont)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              model.newPassword = value;
                            },
                            controller:
                                TextEditingController(text: model.newPassword),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Entrer votre nouveau mot de passe ';
                              } else if (value.length < 8) {
                                return 'Minimum 8 caractères';
                              }
                              return null;
                            },
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: null,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                hintText: "Nouveau mot de passe",
                                labelText: "Nouveau ",
                                labelStyle: TextStyle(fontFamily: familyFont)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              model.confirmNewPass = value;
                            },
                            controller: TextEditingController(
                                text: model.confirmNewPass),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Entrer votre nouveau mot de passe ';
                              } else if (value.length < 8) {
                                return 'Minimum 8 caractères';
                              } else if (model.newPassword !=
                                  model.confirmNewPass) {
                                return 'les nouveaux mots de passe ne sont pas identiques';
                              }
                              return null;
                            },
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: null,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                hintText: "Confirmation du mot de passe",
                                labelText: "Confirmation",
                                labelStyle: TextStyle(fontFamily: familyFont)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomSheet: Container(
                margin: EdgeInsets.only(bottom: 10, right: 15, left: 15),
                width: size.width,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: kPrimaryColor),
                child: RoundedLoadingButton(
                  animateOnTap: false,
                  height: 40,
                  controller: model.btnController,
                  color: kPrimaryColor,
                  borderRadius: 5,
                  onPressed: () async {
                    if (model.formKey.currentState!.validate()) {
                      model.btnController.start();
                      try {
                        model.email = infos!.elementAt(1).toString();
                        await model.userService.updatePassword(model.email,
                            model.password, model.newPassword, context);
                        print('Email : ${model.email}');
                      } catch (e) {
                        Fluttertoast.showToast(
                            msg: "Connection Error ",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 4,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    }
                    model.btnController.stop();
                  },
                  child: Text(
                    'Enregistrer',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => InformationsViewModel());
  }
}
