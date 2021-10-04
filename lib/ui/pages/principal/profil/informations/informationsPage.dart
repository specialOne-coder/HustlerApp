import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hustler/services/userService.dart';
import 'package:hustler/ui/pages/principal/profil/Edit/description/bioPage.dart';
import 'package:hustler/ui/pages/principal/profil/Edit/email/emailPage.dart';
import 'package:hustler/ui/pages/principal/profil/Edit/genre/genrePage.dart';
import 'package:hustler/ui/pages/principal/profil/Edit/naissance/naissancePage.dart';
import 'package:hustler/ui/pages/principal/profil/Edit/names/namesPage.dart';
import 'package:hustler/ui/pages/principal/profil/Edit/number/numberPage.dart';
import 'package:hustler/ui/pages/principal/profil/informations/informationsViewModel.dart';
import 'package:hustler/ui/pages/principal/profil/informations/profileController.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

import '../../../../../constants.dart';

class InformationsPage extends StatelessWidget {
  const InformationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ProfileController profilerController = Get.put(ProfileController());
    return ViewModelBuilder<InformationsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Infos',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
              size: 20,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder<Map<String, dynamic>>(
              future: UserService().userInfos(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Container(
                      height: size.height * 0.8,
                      width: size.width,
                      color: Colors.white,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ));
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
                        Container(
                          padding: EdgeInsets.only(left: 15, right: 10),
                          color: Colors.white,
                          width: size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text('Mes informations',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          //color: kPrimaryColor,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                    ),
                                  ],
                                ),
                                child: SizedBox(
                                  height: 115,
                                  width: 115,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    fit: StackFit.expand,
                                    children: [
                                      Obx(() {
                                        if (profilerController
                                            .isLoading.value) {
                                          return CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/no_user.jpg'),
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                              backgroundColor: Colors.white,
                                            )),
                                          );
                                        } else {
                                          if (profilerController
                                                  .imageURL.length !=
                                              0) {
                                            return CachedNetworkImage(
                                              imageUrl:
                                                  '${baseUrl.toString()}/profilPic/${profilerController.imageURL}',
                                              fit: BoxFit.cover,
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      CircleAvatar(
                                                backgroundColor: Colors.white,
                                                backgroundImage: imageProvider,
                                              ),
                                              placeholder: (context, url) =>
                                                  CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    '${baseUrl.toString()}/profilPic/${model.getPictures(snapshot.data)}'),
                                                child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                  backgroundColor: Colors.white,
                                                )),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            );
                                          } else {
                                            return CircleAvatar(
                                                radius: 60,
                                                backgroundColor: kPrimaryColor,
                                                child: (model
                                                        .getPictures(
                                                            snapshot.data)
                                                        .isEmpty)
                                                    ? Icon(
                                                        Icons.person_pin,
                                                        size: 50,
                                                        color: Colors.white,
                                                      )
                                                    : Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          60)),
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  '${baseUrl.toString()}/profilPic/${model.getPictures(snapshot.data)}'),
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                      ));
                                          }
                                        }
                                      }),
                                      Positioned(
                                        right: -16,
                                        bottom: 0,
                                        child: SizedBox(
                                          height: 46,
                                          width: 46,
                                          // ignore: deprecated_member_use
                                          child: FlatButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              side: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            color: Colors.grey[200],
                                            onPressed: () {
                                              Get.bottomSheet(
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    16.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    16.0)),
                                                  ),
                                                  child: Wrap(
                                                    alignment:
                                                        WrapAlignment.end,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment.end,
                                                    children: [
                                                      ListTile(
                                                        leading:
                                                            Icon(Icons.camera),
                                                        title: Text('Camera'),
                                                        onTap: () {
                                                          Get.back();
                                                          profilerController.uploadImage(
                                                              ImageSource
                                                                  .camera,
                                                              model.getPseudo(
                                                                  snapshot
                                                                      .data));
                                                        },
                                                      ),
                                                      ListTile(
                                                        leading:
                                                            Icon(Icons.image),
                                                        title: Text('Gallery'),
                                                        onTap: () {
                                                          Get.back();
                                                          profilerController
                                                              .uploadImage(
                                                                  ImageSource
                                                                      .gallery,
                                                                  model.getPseudo(
                                                                      snapshot
                                                                          .data));
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Icon(Icons.camera),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              /* CircleAvatar(
                                  radius: 50,
                                  backgroundColor: kPrimaryColor,
                                  child:
                                      (model.getPictures(snapshot.data).isEmpty)
                                          ? Icon(
                                              Icons.person_pin,
                                              size: 30,
                                              color: Colors.white,
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50)),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${baseUrl.toString()}/profilPic/${model.getPictures(snapshot.data)}'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )),*/
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Modifier ma photo de profil',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: size.height,
                          width: size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15, right: 10),
                                child: Text('À propos de vous',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
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
                                                      NamesPage(),
                                                  settings: RouteSettings(
                                                      arguments: userInfos)));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      (model
                                                              .getName(
                                                                  snapshot.data)
                                                              .isNotEmpty)
                                                          ? model.getName(
                                                              snapshot.data)
                                                          : 'Aucun Nom',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      model.getPseudo(
                                                          snapshot.data),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
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
                                      margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
                                      height: 0.5,
                                      color: Colors.grey[400],
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 8.0, 8.0, 12),
                                      //height: size.//height * 0.06,
                                      width: size.width,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BioPage(),
                                                  settings: RouteSettings(
                                                      arguments: userInfos)));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(width: 10),
                                                Text(
                                                  'Décrivez vous !',
                                                  style:
                                                      TextStyle(fontSize: 15),
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      height: 0.5,
                                      color: Colors.grey[400],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 10, top: 20),
                                child: Text('Coordonnées',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
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
                                                      EmailPage(),
                                                  settings: RouteSettings(
                                                      arguments: model.getEmail(
                                                          snapshot.data))));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Adresse E-MAIL',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      model.getEmail(
                                                          snapshot.data),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
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
                                      margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
                                      height: 0.5,
                                      color: Colors.grey[400],
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 8.0, 8.0, 8),
                                      //height: size.//height * 0.06,
                                      width: size.width,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NumberPage(),
                                                  settings: RouteSettings(
                                                      arguments: userInfos)));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Numéro de Téléphone',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      (model
                                                              .getPhone(
                                                                  snapshot.data)
                                                              .isNotEmpty)
                                                          ? model.getPhone(
                                                              snapshot.data)
                                                          : 'Aucun ',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      height: 0.5,
                                      color: Colors.grey[400],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 10, top: 20),
                                child: Text('Informations privées',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
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
                                                      GenrePage(),
                                                  settings: RouteSettings(
                                                      arguments: userInfos)));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Genre',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      (model
                                                              .getGenre(
                                                                  snapshot.data)
                                                              .isNotEmpty)
                                                          ? model.getGenre(
                                                              snapshot.data)
                                                          : 'Non Spécifié ',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
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
                                      margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
                                      height: 0.5,
                                      color: Colors.grey[400],
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 8.0, 8.0, 8),
                                      //height: size.//height * 0.06,
                                      width: size.width,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NaissancePage(),
                                                  settings: RouteSettings(
                                                      arguments: userInfos)));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Date de Naissance',
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      (model
                                                              .getDnaissance(
                                                                  snapshot.data)
                                                              .isNotEmpty)
                                                          ? model.getDnaissance(
                                                              snapshot.data)
                                                          : 'Non Spécifié ',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      height: 0.5,
                                      color: Colors.grey[400],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
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
      viewModelBuilder: () => InformationsViewModel(),
    );
  }
}
