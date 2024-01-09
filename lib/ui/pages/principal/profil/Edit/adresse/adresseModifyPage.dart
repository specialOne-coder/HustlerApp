import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hustler/ui/pages/principal/profil/informations/informationsViewModel.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../constants.dart';

class AdresseModifyPage extends StatelessWidget {
  const AdresseModifyPage({Key? key}) : super(key: key);

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
                  'Modifier',
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
                  child: Form(
                    key: model.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            keyboardType: TextInputType.text,
                            controller:
                                TextEditingController(text: model.adresse),
                            maxLength: 20,
                            onChanged: (value) {
                              model.adresse = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Entrer votre adresse';
                              }
                              return null;
                            },
                            maxLines: null,
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                hintText: "Adresse",
                                labelText:
                                    (infos!.elementAt(4).toString().isEmpty)
                                        ? 'Adresse'
                                        : infos.elementAt(4).toString(),
                                labelStyle: TextStyle(fontFamily: familyFont)),
                          ),
                        ),
                      ],
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
                            infos.elementAt(0).toString(),
                            infos.elementAt(1).toString(),
                            infos.elementAt(2).toString(),
                            infos.elementAt(3).toString(),
                            model.adresse,
                            infos.elementAt(5).toString(),
                            infos.elementAt(6).toString(),
                            infos.elementAt(7).toString(),
                            context);
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
