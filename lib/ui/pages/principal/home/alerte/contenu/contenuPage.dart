import 'package:flutter/material.dart';
import 'package:hustler/services/alerteService.dart';
import 'package:hustler/services/userService.dart';
import 'package:hustler/ui/pages/principal/home/alerte/contenu/contenuViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../constants.dart';
import '../alerteConditionsAccept.dart';

class ContenuPage extends StatelessWidget {
  const ContenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Map? alerte = ModalRoute.of(context)!.settings.arguments as Map;
    //print('id : ${alerte.toString()}');
    return ViewModelBuilder<ContenuViewModel>.reactive(
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
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      color: kPrimaryColor,
                      size: 20,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              body: FutureBuilder<Map<String, dynamic>>(
                  future: AlerteService().alerteInfos(alerte!['_id']),
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
                      List offres = snapshot.data['offres'];
                      return Container(
                        height: size.height,
                        width: size.width,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data['titre'].toString(),
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 12.0),
                                        child: Text(
                                          'Publié le : ${(snapshot.data['createdAt'] == null) ? '' : snapshot.data['createdAt'].toString().substring(0, 10)}',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 12, 0, 12),
                                        height: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                      FutureBuilder<Map<String, dynamic>>(
                                          future: UserService().otherUserInfos(
                                              snapshot.data['alerteurId']),
                                          builder: (context,
                                              AsyncSnapshot snapshot2) {
                                            if (snapshot2.connectionState ==
                                                ConnectionState.waiting)
                                              return Text('');
                                            if (snapshot2.data == null) {
                                              return Text('');
                                            } else {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      CircleAvatar(
                                                          radius: 25,
                                                          backgroundColor:
                                                              Colors.blueGrey,
                                                          child: (snapshot2
                                                                  .data[
                                                                      'pictures']
                                                                  .toString()
                                                                  .isEmpty)
                                                              ? Icon(
                                                                  Icons.person,
                                                                  size: 25,
                                                                  color: Colors
                                                                      .white,
                                                                )
                                                              : Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(25)),
                                                                    image:
                                                                        DecorationImage(
                                                                      image: NetworkImage(
                                                                          '${baseUrl.toString()}/profilPic/${snapshot2.data['pictures']}'),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                )),
                                                      SizedBox(
                                                        width: 7,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            snapshot2
                                                                .data['pseudo'],
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              //color: Colors.grey[500],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 5.0),
                                                            child: Text(
                                                              'voir le profil',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    size: 15,
                                                  )
                                                ],
                                              );
                                            }
                                          }),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 12, 0, 12),
                                        height: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                      Text(
                                        "Description",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12.0, bottom: 10),
                                        child: Text(
                                          snapshot.data['message'],
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Type de service",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Text(
                                          snapshot.data['service'],
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 12, 0, 12),
                                        height: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 12.0),
                                        child: Text(
                                          "Autres informations",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          (snapshot.data['picture']
                                                  .toString()
                                                  .isEmpty)
                                              ? Text(
                                                  'Aucune',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                )
                                              : Container(
                                                  height: size.height * 0.23,
                                                  width: size.width * 0.9,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          '${baseUrl.toString()}/alertePic/${snapshot.data['picture']}'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 12, 0, 12),
                                        height: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                      Text(
                                        "Date de réalisation",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 7.0, bottom: 5.0),
                                        child: Text(
                                          "${(snapshot.data['dateTaf'] == null) ? '' : snapshot.data['dateTaf'].toString().substring(0, 10)}",
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 12, 0, 12),
                                        height: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                      Text(
                                        "Lieu d'intervention",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 7.0, bottom: 5.0),
                                        child: Text(
                                          snapshot.data['position'],
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                                height: 0.5,
                                color: Colors.grey[400],
                              ),
                              (snapshot.data['offersNumber'] != null)
                                  ? Container(
                                      width: size.width,
                                      height: size.height * 0.4,
                                      color: Colors.grey[100],
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10,
                                                left: 15,
                                                bottom: 12.0),
                                            child: Text(
                                              '${snapshot.data['offersNumber']} jobbers intéressés',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: offres.map((jobber) {
                                                return JobberCard(jobber);
                                              }).toList(),
                                            ),
                                          ),
                                        ],
                                      ))
                                  : Container(
                                      width: size.width,
                                      height: size.height * 0.2,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 15, bottom: 12.0),
                                        child: Text(
                                          'Aucun jobber',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        ),
                        // decoration: BoxDecoration(),
                      );
                    }
                  }),
              bottomSheet: Container(
                height: size.height * 0.09,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 4,
                      color: Colors.grey,
                      offset: Offset(0, 3))
                ]),
                child: Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: FutureBuilder<Map<String, dynamic>>(
                      future: model.verifyIdentity(alerte['alerteurId']),
                      builder: (context, AsyncSnapshot snapshot3) {
                        if (snapshot3.connectionState ==
                            ConnectionState.waiting) return Text('');
                        if (snapshot3.data == null) {
                          return Text('');
                        } else {
                          return Container(
                            child: (snapshot3.data['message'] == 'false')
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 7.0),
                                            child: Text(
                                              'Budget : ',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                                '${alerte['prix']}' + ' FCFA',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )
                                        ],
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 13, bottom: 13),
                                          width: size.width * 0.4,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: kPrimaryColor),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AlerteConditionAccept()));
                                            },
                                            child: Text(
                                              'Faire une offrere',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 13, bottom: 13),
                                          width: size.width * 0.4,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Colors.green),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AlerteConditionAccept()));
                                            },
                                            child: Text(
                                              "Mettre fin",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          )),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 13, bottom: 13),
                                          width: size.width * 0.4,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Colors.red),
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AlerteConditionAccept()));
                                            },
                                            child: Text(
                                              "Supprimer l'offre",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ],
                                  ),
                          );
                        }
                      }),
                ),
              ),
            ),
        viewModelBuilder: () => ContenuViewModel());
  }
}

class JobberCard extends StatelessWidget {
  final Map jobberData;
  JobberCard(this.jobberData);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Container(
        height: size.height * 0.2,
        width: size.width * 0.33,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            (jobberData['picture'].toString().isEmpty)
                ? Container(
                    height: size.height * 0.1,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  )
                : Container(
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      image: DecorationImage(
                        image: NetworkImage(
                            '${baseUrl.toString()}/profilPic/${jobberData['picture']}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 2.0),
              child: Text(
                jobberData['nom'],
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
            Icon(
              Icons.next_plan,
              color: kPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
