import 'package:flutter/material.dart';
import 'package:hustler/ui/pages/principal/home/postAgent/creation/postCreationPage.dart';
import '../../../../../constants.dart';
import '../../menu.dart';

class Creation2 extends StatefulWidget {
  const Creation2({Key? key}) : super(key: key);

  @override
  _Creation2State createState() => _Creation2State();
}

class _Creation2State extends State<Creation2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Menu()));
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
                    Text("Promouvoir ses services",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                      child: Text("Promouvez vos services en quelques étapes",
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
                width: size.width * 0.4,
                padding: EdgeInsets.only(top: 20, bottom: 20),
                color: Colors.grey[200],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.add_a_photo, size: 30),
                        onPressed: () {}),
                    Text(
                      'Ajouter',
                      style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                    )
                  ],
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PostCreationPage()));
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
    );
  }
}
