import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hustler/ui/pages/principal/home/alerte/dateTravail.dart';
import 'package:hustler/ui/pages/principal/home/alerte/picController.dart';
import 'package:hustler/ui/pages/principal/menu.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

import '../../../../../constants.dart';
import 'creation/creationViewModel.dart';

class PhotoChoicePage extends StatelessWidget {
  const PhotoChoicePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PicController picController = Get.put(PicController());
    AlerteCreationViewModel alerteCreationViewModel =
        new AlerteCreationViewModel();
    AlerteCreationViewModel alerte =
        ModalRoute.of(context)?.settings.arguments as AlerteCreationViewModel;
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
                          width: size.width * 0.64,
                          height: 3,
                          color: Colors.pink),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                        child: Text("Ajouter une photo ?",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: Text(
                            "Vous pouvez ajouter des photos pour mieux decrire votre besoin",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w300)),
                      ),
                      Center(
                          child: Container(
                        width: size.width * 0.7,
                        height: size.height * 0.3,
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        color: Colors.grey[200],
                        child: SizedBox(
                          height: 115,
                          width: 115,
                          child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.expand,
                            children: [
                              Obx(() {
                                if (picController.isLoading.value) {
                                  return Container();
                                } else {
                                  if (picController.image.toString().length !=
                                      0) {
                                    return Container(
                                        width: size.width,
                                        child: Image.file(picController.image));
                                  } else {
                                    return Container(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/no_user.jpg'),
                                      ),
                                    );
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
                                      borderRadius: BorderRadius.circular(50),
                                      side: BorderSide(color: Colors.white),
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
                                                        Radius.circular(16.0),
                                                    topRight:
                                                        Radius.circular(16.0)),
                                          ),
                                          child: Wrap(
                                            alignment: WrapAlignment.end,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.end,
                                            children: [
                                              ListTile(
                                                leading: Icon(Icons.camera),
                                                title: Text('Camera'),
                                                onTap: () {
                                                  Get.back();
                                                  picController.uploadImage(
                                                    ImageSource.camera,
                                                  );
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.image),
                                                title: Text('Gallery'),
                                                onTap: () {
                                                  Get.back();
                                                  picController.uploadImage(
                                                    ImageSource.gallery,
                                                  );
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
                      ))
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
                    padding: EdgeInsets.only(left: 10, right: 15),
                    //width: size.width * 0.6,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: kPrimaryColor),
                    child: TextButton(
                      onPressed: () {
                        alerteCreationViewModel.alerteurId = alerte.alerteurId;
                        alerteCreationViewModel.titre = alerte.titre;
                        alerteCreationViewModel.message = alerte.message;
                        alerteCreationViewModel.service = alerte.service;
                        alerteCreationViewModel.position = alerte.position;
                        alerteCreationViewModel.prix = alerte.prix;
                        alerteCreationViewModel.picture =
                            picController.image.toString();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DateTravailPage(),
                                settings: RouteSettings(
                                    arguments: alerteCreationViewModel)));
                      },
                      child: Text(
                        'Passer',
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
