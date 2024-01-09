import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hustler/services/userService.dart';
import 'package:hustler/ui/pages/principal/home/alerte/creation/creationViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../constants.dart';
import '../../../menu.dart';

class AlerteCreationPage extends StatelessWidget {
  const AlerteCreationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AlerteCreationViewModel alerte =
        ModalRoute.of(context)?.settings.arguments as AlerteCreationViewModel;
    List alerteObj = [
      {
        'alerteurId': alerte.alerteurId.toString(),
        'service': alerte.service.toString(),
        'titre': alerte.titre.toString(),
        'message': alerte.alerteMessage.toString(),
        'picture': alerte.picture.toString(),
        'dateTaf': alerte.dateTaf.toString(),
        'position': alerte.position.toString(),
        'prix': alerte.prix.toString(),
      }
    ];
    Size size = MediaQuery.of(context).size;
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Menu()));
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  color: Colors.grey[300],
                  height: size.height,
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
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 8.0),
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
                          width: size.width * 0.98,
                          height: 3,
                          color: Colors.pink),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 50),
                          child: Column(
                              children: alerteObj.map((alt) {
                            return AlertCardFinal(alt);
                          }).toList())),
                    ],
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
                      onPressed: () {},
                      child: Text(
                        'Partager',
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

class AlertCardFinal extends StatelessWidget {
  final Map alerteData;
  AlertCardFinal(this.alerteData);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(10),
      //height: size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //height: size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(12)),
            ),
            child: Container(
              width: size.width,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.6,
                    child: Text(
                      alerteData['titre'],
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    //width: size.width * 0.3,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //color: kPrimaryColor,
                        border: Border.all(color: kPrimaryColor)),
                    child: Center(
                      child: Text(
                        'Offre',
                        style: TextStyle(
                          fontSize: 10,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 4),
            child: Container(
              child: Text(alerteData['message'],
                  maxLines: 2, style: GoogleFonts.notoSerif(fontSize: 14)),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 7, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureBuilder<Map<String, dynamic>>(
                    future:
                        UserService().otherUserInfos(alerteData['alerteurId']),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return Text('');
                      if (snapshot.data == null) {
                        return Text('');
                      } else {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.blueGrey,
                                child: (snapshot.data['pictures']
                                        .toString()
                                        .isEmpty)
                                    ? Icon(
                                        Icons.person,
                                        size: 22,
                                        color: Colors.white,
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                '${baseUrl.toString()}/profilPic/${snapshot.data['pictures']}'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )),
                            SizedBox(
                              width: 7,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Par ' + snapshot.data['pseudo'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    //color: Colors.grey[500],
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    '${(alerteData['createdAt'] == null) ? '' : alerteData['createdAt'].toString().substring(0, 10)}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      }
                    }),
                Container(
                  width: size.width * 0.3,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: kPrimaryColor),
                  child: Center(
                    child: Text(
                      alerteData['prix'] + ' cfa ',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 8, 10, 5),
            height: 0.5,
            color: Colors.grey[400],
          ),
          Container(
            width: size.width,
            margin: EdgeInsets.fromLTRB(10, 3, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: Colors.blueGrey,
                      size: 14,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: size.width * 0.4,
                      child: Text(
                        alerteData['position'],
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[850],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  "${(alerteData['offersNumber'] == null) ? 0 : alerteData['offersNumber']} offres ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[850],
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
