import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hustler/services/alerteService.dart';
import 'package:hustler/services/userService.dart';
import 'package:hustler/ui/pages/principal/home/alerte/contenu/contenuPage.dart';
import 'package:hustler/ui/pages/principal/home/alerte/list/alerteListViewModel.dart';
import 'package:hustler/ui/pages/principal/home/notConnected.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../constants.dart';

class AlerteList extends StatelessWidget {
  const AlerteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<AlerteListViewModel>.reactive(
        builder: (context, model, child) => Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              //color: Colors.grey[300],
              child: FutureBuilder<List>(
                  future: AlerteService().allAlertes(),
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
                      return Center(
                          child: Container(
                              height: size.height * 0.8,
                              width: size.width,
                              child: NotConnected()));
                    } else {
                      List alerteInfos = snapshot.data;
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(left: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 4,
                                                  color: Colors.grey,
                                                  offset: Offset(0, 1))
                                            ]),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'cherchez une annonce',
                                              contentPadding:
                                                  EdgeInsets.all(10)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 4,
                                                color: Colors.grey,
                                                offset: Offset(0, 1)),
                                          ]),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Center(
                                          child: Icon(
                                            Icons.search,
                                            //size: 26,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            shape: CircleBorder(), backgroundColor: kPrimaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: alerteInfos.map((alerte) {
                                return AlertCard(alerte);
                              }).toList(),
                            ),
                          )
                        ],
                      );
                    }
                  }),
            ),
        viewModelBuilder: () => AlerteListViewModel());
  }
}

class AlertCard extends StatelessWidget {
  final Map alerteData;
  AlertCard(this.alerteData);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        print('size : ${alerteData['message'].toString().length}');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ContenuPage(),
                settings: RouteSettings(arguments: alerteData)));
      },
      child: Container(
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
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(12)),
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
                      future: UserService()
                          .otherUserInfos(alerteData['alerteurId']),
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
      ),
    );
  }
}
