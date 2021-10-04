import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hustler/services/userService.dart';
import 'package:hustler/ui/pages/principal/profil/adresse/adressePage.dart';
import 'package:hustler/ui/pages/principal/profil/competences/competencePage.dart';
import 'package:hustler/ui/pages/principal/profil/conditions/conditionPage.dart';
import 'package:hustler/ui/pages/principal/profil/informations/informationsPage.dart';
import 'package:hustler/ui/pages/principal/profil/infos/infosPage.dart';
import 'package:hustler/ui/pages/principal/profil/pro/proPage.dart';
import 'package:hustler/ui/pages/principal/profil/profilPage/profilViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../constants.dart';
import '../aide.dart';
import '../invitation.dart';
import '../parametre.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<ProfilViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: size.height * 0.14,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Container(
            padding: EdgeInsets.only(top: 10),
            child: FutureBuilder<Map<String, dynamic>>(
              future: UserService().userInfos(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Text('');
                } else {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => InfosPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.getPseudo(snapshot.data),
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text('Voir et modifier mon profil',
                                  maxLines: 2,
                                  style: GoogleFonts.nunito(
                                      color: Colors.grey[700], fontSize: 14)),
                            ),
                          ],
                        ),
                        CircleAvatar(
                            radius: 26,
                            backgroundColor: kPrimaryColor,
                            child: (model.getPictures(snapshot.data).isEmpty)
                                ? Icon(
                                    Icons.person_pin,
                                    size: 30,
                                    color: Colors.white,
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(26)),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            '${baseUrl.toString()}/profilPic/${model.getPictures(snapshot.data)}'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
        body: Container(
          height: size.height * 0.85,
          width: size.width,
          color: Colors.grey[200],
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  //height: size.height,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        //height: size.height * 0.06,
                        width: size.width,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InformationsPage(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.person_pin, color: kPrimaryColor),
                                  SizedBox(width: 10),
                                  Text(
                                    'Mes informations',
                                    style: GoogleFonts.nunito(fontSize: 15),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(35, 0, 0, 5),
                        height: 0.5,
                        color: Colors.grey[400],
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        //height: size.//height * 0.06,
                        width: size.width,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdressePage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.place_outlined,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Mon adresse',
                                    style: GoogleFonts.nunito(fontSize: 15),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(35, 0, 0, 5),
                        height: 0.5,
                        color: Colors.grey[400],
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        //height: size.//height * 0.06,
                        width: size.width,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ConditionPage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.privacy_tip_outlined,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Conditions génerales',
                                    style: GoogleFonts.nunito(fontSize: 15),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  //height: size.//height * 0.2,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        //height: size.//height * 0.06,
                        width: size.width,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProPage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.verified, color: kPrimaryColor),
                                  SizedBox(width: 10),
                                  Text(
                                    'Devenir PRO',
                                    style: GoogleFonts.nunito(fontSize: 15),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(35, 0, 0, 5),
                        height: 0.5,
                        color: Colors.grey[400],
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        //height: size.//height * 0.06,
                        width: size.width,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CompetencePage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit_road,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Mes competences',
                                    style: GoogleFonts.nunito(fontSize: 15),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(35, 0, 0, 5),
                        height: 0.5,
                        color: Colors.grey[400],
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        //height: size.//height * 0.06,
                        width: size.width,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Aides()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.help_outline_rounded,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Obtenir de l'aide",
                                    style: GoogleFonts.nunito(fontSize: 15),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  //height: size.//height * 0.2,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        //height: size.//height * 0.06,
                        width: size.width,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ParametrePage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.settings_sharp,
                                      color: kPrimaryColor),
                                  SizedBox(width: 10),
                                  Text(
                                    'Paramètres',
                                    style: GoogleFonts.nunito(fontSize: 15),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(35, 0, 0, 5),
                        height: 0.5,
                        color: Colors.grey[400],
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        //height: size.//height * 0.06,
                        width: size.width,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Invitation()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.mobile_screen_share_outlined,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Inviter des amis",
                                    style: GoogleFonts.nunito(fontSize: 15),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(35, 0, 0, 5),
                        height: 0.5,
                        color: Colors.grey[400],
                      ),
                      InkWell(
                        onTap: () async {
                          print('ok ok');
                          try {
                            await UserService().logout(context);
                          } catch (e) {}
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          //height: size.//height * 0.06,
                          width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color: kPrimaryColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Deconnexion',
                                    style: GoogleFonts.nunito(fontSize: 15),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Hustler',
                  style: GoogleFonts.nunito(fontSize: 15),
                ),
                Text(
                  'Version ' + version,
                  style: GoogleFonts.nunito(fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ProfilViewModel(),
    );
  }
}
