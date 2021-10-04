import 'package:flutter/material.dart';
import 'package:hustler/constants.dart';

class Invitation extends StatefulWidget {
  const Invitation({Key? key}) : super(key: key);

  @override
  _InvitationState createState() => _InvitationState();
}

class _InvitationState extends State<Invitation> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                height: size.height * 0.08,
                width: size.width,
                child: Text("Invitez vos proches",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  "Invitez vos amis sur Hustler pour beneficier d'enormes surpprises , n'hesitez pas a partager l'appli avec vos amis si vous la trouver géniale",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Text(
                  "Lorsque vous partagerez l'appli votre cote en tant que jobber pourra augmenter et vous pouvez meme devenir PRO si vous faisez suffisament de partage",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                //margin: EdgeInsets.only(top: 13, bottom: 13),
                width: size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: kPrimaryColor),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Partager le lien',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
