import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hustler/ui/pages/principal/profil/pro/proViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../constants.dart';

class ProPage extends StatelessWidget {
  const ProPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder.reactive(
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
                centerTitle: true,
                title: Text(
                  'Badge Pro',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/welc.svg",
                        height: size.height * 0.45,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 10, left: 10, right: 10),
                        child: Text(
                          'Passez au niveau professionnel avec le statut PRO',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Text(
                          'Activez votre badge PRO , remportez plus de jobs et débloquez des nouveaux services',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomSheet: Container(
                margin: EdgeInsets.only(bottom: 10, right: 15, left: 15),
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: kPrimaryColor),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Commencer',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => ProViewModel());
  }
}
