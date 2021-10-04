import 'package:flutter/material.dart';
import 'package:hustler/ui/pages/principal/profil/informations/informationsViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../constants.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final String? infos = ModalRoute.of(context)!.settings.arguments as String;
    return ViewModelBuilder<InformationsViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  'Email',
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                        child: TextFormField(
                          initialValue: infos,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              hintText: "Email",
                              labelText: "Email",
                              labelStyle: TextStyle(fontFamily: familyFont)),
                        ),
                      ),
                    ],
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
                child: TextButton(
                  onPressed: () {},
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
