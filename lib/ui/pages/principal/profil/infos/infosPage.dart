import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hustler/services/userService.dart';
import 'package:hustler/ui/pages/principal/profil/informations/informationsPage.dart';
import 'package:hustler/ui/pages/principal/profil/infos/infosViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../constants.dart';

class InfosPage extends StatelessWidget {
  const InfosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<InfosViewModel>.reactive(
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
                      Icons.edit,
                      color: kPrimaryColor,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InformationsPage()));
                    },
                  )
                ],
              ),
              body: FutureBuilder<Map<String, dynamic>>(
                  future: UserService().userInfos(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return Center(child: CircularProgressIndicator());
                    if (snapshot.data == null) {
                      return Text('');
                    } else {
                      return Container(
                        padding: EdgeInsets.only(left: 15, right: 10),
                        child: Column(
                          children: [
                            Row(
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.place, size: 15),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                              (model
                                                      .getAdresse(snapshot.data)
                                                      .isEmpty)
                                                  ? 'Ajouter une adresse'
                                                  : model.getAdresse(
                                                      snapshot.data),
                                              maxLines: 2,
                                              style: GoogleFonts.nunito(
                                                  color: Colors.grey[700],
                                                  fontSize: 14)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                    radius: 26,
                                    backgroundColor: kPrimaryColor,
                                    child: (model
                                            .getPictures(snapshot.data)
                                            .isEmpty)
                                        ? Icon(
                                            Icons.person_pin,
                                            size: 30,
                                            color: Colors.white,
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(26)),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    '${baseUrl.toString()}/profilPic/${model.getPictures(snapshot.data)}'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 200, 15),
                              height: 0.5,
                              color: Colors.grey[400],
                            ),
                            Container(
                              width: size.width,
                              child: Text(
                                  (model.getBio(snapshot.data).isEmpty)
                                      ? 'Pas de description'
                                      : model.getBio(snapshot.data),
                                  style: GoogleFonts.nunito(
                                      color: Colors.grey[700], fontSize: 15)),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              height: 0.5,
                              color: Colors.grey[400],
                            ),
                            Container(
                              width: size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Membre depuis',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(model.getCreationDate(snapshot.data),
                                      style: GoogleFonts.nunito(
                                          color: Colors.grey[700],
                                          fontSize: 15)),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  }),
            ),
        viewModelBuilder: () => InfosViewModel());
  }
}
