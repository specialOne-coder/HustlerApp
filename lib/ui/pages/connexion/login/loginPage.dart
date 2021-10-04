import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:hustler/ui/pages/accueil/accueil.dart';
import 'package:hustler/ui/pages/connexion/forget/forgetPage.dart';
import 'package:hustler/ui/pages/connexion/login/loginViewModel.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
//import 'package:hustler/ui/pages/principal/menu.dart';
import 'package:stacked/stacked.dart';

import '../../../../constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Accueil()));
                  },
                ),
              ),
              //backgroundColor: kPrimaryColor,
              body: Stack(
                children: [
                  Container(
                    color: kPrimaryColor,
                    height: size.height,
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      "assets/icons/access.svg",
                      height: size.height * 0.33,
                      width: size.width,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: size.height * 0.5,
                      width: size.width,
                      //margin: EdgeInsets.only(top: 0),
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(50.0),
                          topRight: const Radius.circular(50.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          child: Form(
                            autovalidateMode: AutovalidateMode.always,
                            key: model.formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller:
                                      TextEditingController(text: model.email),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    model.email = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Renseigner votre email';
                                    } else if (RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                      return null;
                                    } else {
                                      return 'Entrer un email valide';
                                    }
                                  },
                                  decoration: InputDecoration(
                                      hintText: "votre adresse email",
                                      labelText: "Email",
                                      labelStyle: TextStyle(
                                          fontFamily: familyFont, fontSize: 13),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red))),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: TextEditingController(
                                      text: model.password),
                                  onChanged: (value) {
                                    model.password = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Renseigner votre mot de passe';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Entrer votre mot de passe",
                                      labelText: "Mot de passe",
                                      labelStyle: TextStyle(
                                          fontFamily: familyFont, fontSize: 13),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red))),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ForgetPage()));
                                        },
                                        child: Text(
                                          'mot de passe oublié',
                                          style: TextStyle(
                                              fontSize: 12,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: kPrimaryColor,
                                              color: kPrimaryColor),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Se connecter",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      child: CircleAvatar(
                                          radius: 25,
                                          backgroundColor: kPrimaryColor,
                                          child: RoundedLoadingButton(
                                              animateOnTap: false,
                                              color: kPrimaryColor,
                                              child: Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                size: 22,
                                                color: Colors.white,
                                              ),
                                              controller: model.btnController,
                                              onPressed: () async {
                                                if (model.formKey.currentState!
                                                    .validate()) {
                                                  model.btnController.start();
                                                  try {
                                                    await model.authService
                                                        .login(
                                                            model.email,
                                                            model.password,
                                                            context);
                                                  } catch (e) {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            "Connection Error ",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 4,
                                                        backgroundColor:
                                                            Colors.red,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                  }
                                                }
                                                Timer(Duration(seconds: 2), () {
                                                  model.btnController.stop();
                                                });
                                              })),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
        viewModelBuilder: () => LoginViewModel());
  }
}
