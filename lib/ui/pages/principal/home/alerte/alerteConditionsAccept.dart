import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hustler/ui/pages/principal/home/alerte/sendOffre/sendOffrePage.dart';

import '../../../../../constants.dart';

class AlerteConditionAccept extends StatefulWidget {
  const AlerteConditionAccept({Key? key}) : super(key: key);

  @override
  _AlerteConditionAcceptState createState() => _AlerteConditionAcceptState();
}

class _AlerteConditionAcceptState extends State<AlerteConditionAccept> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                "assets/icons/accept.svg",
                height: size.height * 0.45,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 10, left: 10, right: 10),
                child: Text(
                  'Les conditions du client',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Text(
                  'En continuant , vous acceptez tous les conditions que propose le client pour ce job .',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
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
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SendOffrePage()));
          },
          child: Text(
            'Accepter',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
