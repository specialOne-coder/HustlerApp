import 'package:flutter/material.dart';

import '../../../../constants.dart';

class Aides extends StatefulWidget {
  const Aides({Key? key}) : super(key: key);

  @override
  _AidesState createState() => _AidesState();
}

class _AidesState extends State<Aides> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Aide',
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
          color: Colors.grey[200],
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, right: 10),
                color: Colors.white,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Centre d'assistance",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                      child: Text("Une question ? Nous y répondons",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                height: 0.5,
                color: Colors.grey[400],
              ),
              Container(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 10, top: 23),
                      child: Text('Questions fréquentes',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 5, top: 10.0, bottom: 10.0, right: 8),
                            //height: size.height * 0.06,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      'Comment déclarer mon jobber ?',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 8.0, 8.0, 8),
                            //height: size.//height * 0.06,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      'Comment être pâyé ?',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 10, top: 23),
                      child: Text('Vous êtes clients ?',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 5, top: 10.0, bottom: 10.0, right: 8),
                            //height: size.height * 0.06,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      'Publier une annonce',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 5, top: 10.0, bottom: 10.0, right: 8),
                            //height: size.height * 0.06,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      'Recevoir des offres',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 5, top: 10.0, bottom: 10.0, right: 8),
                            //height: size.height * 0.06,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      'Selectionner un jobber',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 5, top: 10.0, bottom: 10.0, right: 8),
                            //height: size.height * 0.06,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      'Le paiement',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 5, top: 10.0, bottom: 10.0, right: 8),
                            //height: size.height * 0.06,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      'La notation',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 5, top: 10.0, bottom: 10.0, right: 8),
                            //height: size.height * 0.06,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      'Assurance',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 8.0, 8.0, 8),
                            //height: size.//height * 0.06,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      'Déclaration',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 10, top: 23),
                      child: Text('Vous êtes jobber ?',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 5, top: 10.0, bottom: 10.0, right: 8),
                            //height: size.height * 0.06,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      'Trouver un job',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 5, top: 10.0, bottom: 10.0, right: 8),
                            //height: size.height * 0.06,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      'Faire une offre',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 5, top: 10.0, bottom: 10.0, right: 8),
                            //height: size.height * 0.06,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      "Pendant l'intervention",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 5, top: 10.0, bottom: 10.0, right: 8),
                            //height: size.height * 0.06,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      'Le paiement',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 5, top: 10.0, bottom: 10.0, right: 8),
                            //height: size.height * 0.06,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      'La notation',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 5, top: 10.0, bottom: 10.0, right: 8),
                            //height: size.height * 0.06,
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10),
                                    Text(
                                      'Assurance',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: 0.5,
                            color: Colors.grey[400],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
