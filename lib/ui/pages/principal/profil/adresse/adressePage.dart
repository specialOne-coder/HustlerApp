import 'package:flutter/material.dart';
import 'package:hustler/services/userService.dart';
import 'package:hustler/ui/pages/principal/profil/Edit/adresse/adresseModifyPage.dart';
import 'package:hustler/ui/pages/principal/profil/informations/informationsViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../constants.dart';

class AdressePage extends StatelessWidget {
  const AdressePage({Key? key}) : super(key: key);

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
                  'Adresse',
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
                          model.getName(snapshot.data),
                          model.getBio(snapshot.data),
                          model.getPhone(snapshot.data),
                          model.getAdresse(snapshot.data),
                          model.getPictures(snapshot.data),
                          model.getGenre(snapshot.data),
                          model.getDnaissance(snapshot.data),
                        ];
                        return Container(
                          color: Colors.grey[200],
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25,
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
                                            padding: EdgeInsets.only(
                                                left: 5,
                                                top: 8.0,
                                                bottom: 8.0,
                                                right: 8),
                                            //height: size.height * 0.06,
                                            width: size.width,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            AdresseModifyPage(),
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
                                                            .start,
                                                    children: [
                                                      Icon(Icons.place_outlined,
                                                          color:
                                                              Colors.grey[800],
                                                          size: 25),
                                                      SizedBox(width: 10),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Adresse principale',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 8.0),
                                                            child: Container(
                                                              width:
                                                                  size.width *
                                                                      0.8,
                                                              child: Text(
                                                                (model
                                                                        .getAdresse(snapshot
                                                                            .data)
                                                                        .isNotEmpty)
                                                                    ? model.getAdresse(
                                                                        snapshot
                                                                            .data)
                                                                    : 'Entrer votre adresse',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
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
