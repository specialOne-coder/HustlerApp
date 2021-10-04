import 'package:flutter/material.dart';
import 'package:hustler/services/userService.dart';
import 'package:stacked/stacked.dart';

import '../../../../constants.dart';
import 'Edit/contact/contactPage.dart';
import 'Edit/password/passwordPage.dart';
import 'informations/informationsViewModel.dart';

class ParametrePage extends StatelessWidget {
  const ParametrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<InformationsViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  'Paramètres',
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
                child: FutureBuilder<Map<String, dynamic>>(
                    future: UserService().userInfos(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return Center(child: CircularProgressIndicator());
                      if (snapshot.data == null) {
                        return Text('');
                      } else {
                        List userInfos = [
                          model.getPseudo(snapshot.data),
                          model.getEmail(snapshot.data),
                          model.getName(snapshot.data),
                          model.getBio(snapshot.data),
                          model.getPhone(snapshot.data),
                          model.getAdresse(snapshot.data),
                          model.getPictures(snapshot.data),
                          model.getGenre(snapshot.data),
                          model.getDnaissance(snapshot.data),
                        ];
                        return Container(
                          height: size.height,
                          color: Colors.grey[200],
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                height: 0.5,
                                color: Colors.grey[400],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            height: 0.5,
                                            color: Colors.grey[400],
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 5,
                                                top: 10.0,
                                                bottom: 10.0,
                                                right: 8),
                                            //height: size.height * 0.06,
                                            width: size.width,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PasswordPage(),
                                                        settings: RouteSettings(
                                                            arguments:
                                                                userInfos)));
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(width: 10),
                                                      Text(
                                                        'Changer de mot de passe',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    size: 15,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                15, 0, 0, 5),
                                            height: 0.5,
                                            color: Colors.grey[400],
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 5,
                                                top: 10.0,
                                                bottom: 10.0,
                                                right: 8),
                                            //height: size.height * 0.06,
                                            width: size.width,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(width: 10),
                                                    Text(
                                                      'Mode de versement',
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: 15,
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                15, 0, 0, 5),
                                            height: 0.5,
                                            color: Colors.grey[400],
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 5,
                                                top: 10.0,
                                                bottom: 10.0,
                                                right: 8),
                                            //height: size.height * 0.06,
                                            width: size.width,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ContactPage()));
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(width: 10),
                                                      Text(
                                                        'Contactez-nous',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ],
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    size: 15,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                15, 0, 0, 5),
                                            height: 0.5,
                                            color: Colors.grey[400],
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                5, 8.0, 8.0, 8),
                                            //height: size.//height * 0.06,
                                            width: size.width,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(width: 10),
                                                    Text(
                                                      'À propos',
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: 15,
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            height: 0.5,
                                            color: Colors.grey[400],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            height: 0.5,
                                            color: Colors.grey[400],
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              try {
                                                await UserService()
                                                    .logout(context);
                                              } catch (e) {}
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 5,
                                                  top: 10.0,
                                                  bottom: 10.0,
                                                  right: 8),
                                              //height: size.height * 0.06,
                                              width: size.width,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(width: 10),
                                                      Text(
                                                        'Deconnexion',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.red),
                                                      ),
                                                    ],
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    size: 15,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            height: 0.5,
                                            color: Colors.grey[400],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    }),
              ),
            ),
        viewModelBuilder: () => InformationsViewModel());
  }
}
