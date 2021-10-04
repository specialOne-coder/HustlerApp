import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hustler/ui/pages/principal/profil/informations/informationsViewModel.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../constants.dart';

class NamesPage extends StatelessWidget {
  const NamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List? infos = ModalRoute.of(context)!.settings.arguments as List;
    return ViewModelBuilder<InformationsViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  'Noms',
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
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: model.formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.name,
                            controller:
                                TextEditingController(text: model.pseudo),
                            onChanged: (value) {
                              model.pseudo = value;
                            },
                            maxLength: 12,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Entrer un nouveau nom d'utilisateur ";
                              } else if (value.length < 5) {
                                return 'Au minimum 5 caractères ';
                              }
                            },
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                hintText: infos!.elementAt(0).toString(),
                                labelText: infos.elementAt(0).toString(),
                                labelStyle: TextStyle(fontFamily: familyFont)),
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: TextEditingController(text: model.name),
                            keyboardType: TextInputType.name,
                            onChanged: (value) {
                              model.name = value;
                            },
                            maxLength: 12,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Entrer un nouveau nom  ";
                              } else if (value.length < 3) {
                                return 'Au minimum 5 caractères ';
                              }
                            },
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: null,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                hintText: infos.elementAt(1).toString(),
                                labelText:
                                    (infos.elementAt(1).toString().isEmpty)
                                        ? 'Nom'
                                        : infos.elementAt(1).toString(),
                                labelStyle: TextStyle(fontFamily: familyFont)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              bottomSheet: Container(
                margin: EdgeInsets.only(bottom: 10, right: 15, left: 15),
                width: size.width,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: kPrimaryColor),
                child: RoundedLoadingButton(
                  animateOnTap: false,
                  controller: model.btnController,
                  color: kPrimaryColor,
                  borderRadius: 5,
                  onPressed: () async {
                    if (model.formKey.currentState!.validate()) {
                      model.btnController.start();
                      try {
                        await model.userService.updateUser(
                            model.pseudo,
                            model.name,
                            infos.elementAt(2).toString(),
                            infos.elementAt(3).toString(),
                            infos.elementAt(4).toString(),
                            infos.elementAt(5).toString(),
                            infos.elementAt(6).toString(),
                            infos.elementAt(7).toString(),
                            context);
                        print('Username : ${model.pseudo}');
                      } catch (e) {
                        Fluttertoast.showToast(
                            msg: "Connection Error ",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 4,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    }
                    model.btnController.stop();
                  },
                  child: Text(
                    'Enregistrer',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => InformationsViewModel());
  }
}
