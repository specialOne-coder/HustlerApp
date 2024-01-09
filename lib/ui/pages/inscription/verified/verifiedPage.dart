import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hustler/ui/pages/inscription/verified/verifiedViewModel.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:stacked/stacked.dart';

import '../../../../constants.dart';

class VerifiedPage extends StatelessWidget {
  const VerifiedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Object? emailPass = ModalRoute.of(context)!.settings.arguments;
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<VerifyViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              //backgroundColor: kPrimaryColor,
              body: Stack(
                children: [
                  Container(
                    //color: kPrimaryColor,
                    height: size.height,
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      "assets/icons/verified.svg",
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
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        maxLength: 6,
                                        onChanged: (value) {
                                          model.convert = model.code.toString();
                                          model.convert = value;
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Entrer votre code de reinitialisation';
                                          } else if (value.length < 6) {
                                            return '6 chiffres ';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            hintText:
                                                "Entrer le code de verification",
                                            labelText: "code de vérification",
                                            labelStyle: TextStyle(
                                                fontFamily: familyFont)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: RoundedLoadingButton(
                                      animateOnTap: false,
                                      controller: model.btnController2,
                                      color: Colors.white,
                                      onPressed: () async {
                                        await model.authService
                                            .resendVerifiedCode(emailPass);
                                        if (model.authService.success == true) {
                                          model.btnController2.success();
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Renvoyer",
                                            style: TextStyle(
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                          Icon(
                                            Icons.rotate_right_sharp,
                                            color: kPrimaryColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
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
                                    "Confirmer",
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
                                                      .veried(model.convert,
                                                          context);
                                                } catch (e) {
                                                  Fluttertoast.showToast(
                                                      msg: "Connection Error",
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
                                        onTap: () {},
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
        viewModelBuilder: () => VerifyViewModel());
  }
}
