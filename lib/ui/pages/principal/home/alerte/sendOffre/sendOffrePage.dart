import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hustler/ui/pages/principal/home/alerte/sendOffre/sendOffreViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../constants.dart';

class SendOffrePage extends StatelessWidget {
  const SendOffrePage({Key? key}) : super(key: key);

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
                    Icons.cancel,
                    color: kPrimaryColor,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
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
                        "assets/icons/send_offer.svg",
                        height: size.height * 0.45,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 10, left: 10, right: 10),
                        child: Text(
                          'Envoyer votre offre',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Text(
                          'Postuler maintenant et laissez le client vous contacter.',
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
                    'Postuler',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => SendOffreViewModel());
  }
}
