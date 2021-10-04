import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hustler/ui/pages/connexion/login/loginPage.dart';
import 'package:hustler/ui/pages/inscription/complete/completePage.dart';
import 'package:hustler/ui/pages/inscription/complete/completeViewModel.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../constants.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  CompleteViewModel completeViewModel = new CompleteViewModel();

  // checked
  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    if (isChecked == false) {
      return Colors.red;
    } else {
      return kPrimaryColor;
    }
  }

  final formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
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
            height: size.height,
            color: kPrimaryColor,
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(
              "assets/icons/register.svg",
              height: size.height * 0.33,
              width: size.width,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: size.height * 0.5,
              width: size.width,
              margin: const EdgeInsets.only(top: 250),
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
                    key: formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              completeViewModel.email = value;
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
                                        BorderSide(color: Colors.red)))),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: TextEditingController(
                              text: completeViewModel.password),
                          onChanged: (value) {
                            completeViewModel.password = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Entrer votre nouveau mot de passe ';
                            } else if (value.length < 8) {
                              return 'Au minimum 8 caractères ';
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "choisissez un mot de passe",
                              labelText: "Mot de passe",
                              labelStyle: TextStyle(
                                  fontFamily: familyFont, fontSize: 13),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "j'accepte les conditions d'utilisations",
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Continuer",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
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
                                      controller: btnController,
                                      onPressed: () async {
                                        if (formKey.currentState!.validate() &&
                                            isChecked == true) {
                                          Timer(Duration(seconds: 1), () {
                                            btnController.start();
                                          });
                                          Timer(Duration(seconds: 3), () {
                                            btnController.stop();
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CompletePage(),
                                                    settings: RouteSettings(
                                                        arguments:
                                                            completeViewModel)));
                                          });
                                        }
                                      })),
                            ),
                          ],
                        ),
                        //Spacer(),

                        Container(
                          padding: EdgeInsets.only(top: 20),
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
                                            builder: (context) => LoginPage()));
                                  },
                                  child: Text(
                                    " Conditions d'utilisations de Hustler",
                                    style: TextStyle(
                                        color: kPrimaryColor, fontSize: 11),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
