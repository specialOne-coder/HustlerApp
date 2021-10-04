import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hustler/ui/pages/connexion/forget/forgetViewModel.dart';
import 'package:hustler/ui/pages/connexion/login/loginPage.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:stacked/stacked.dart';

import '../../../../constants.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<ForgetViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
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
              //backgroundColor: kPrimaryColor,
              body: Stack(
                children: [
                  Container(
                    //color: kPrimaryColor,
                    height: size.height,
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      "assets/icons/forget.svg",
                      height: size.height * 0.3,
                      width: size.width,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: size.height * 0.5,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(50.0),
                          topRight: const Radius.circular(50.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: model.formKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
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
                                    hintText: "Email",
                                    labelText: "Email",
                                    labelStyle:
                                        TextStyle(fontFamily: familyFont)),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Envoyer",
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
                                              Icons.arrow_forward_ios_outlined,
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
                                                      .forgetPass(
                                                          model.email, context);
                                                } catch (e) {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Connection Error forget page ",
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
                              Spacer(),
                              Container(
                                //margin: const EdgeInsets.only(top:2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.verified_rounded,
                                      color: kPrimaryColor,
                                      size: 15,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()));
                                        },
                                        child: Text(
                                          " Conditions d'utilisations de Hustler",
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontSize: 11),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
        viewModelBuilder: () => ForgetViewModel());
  }
}
