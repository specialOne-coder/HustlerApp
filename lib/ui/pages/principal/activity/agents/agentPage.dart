import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hustler/ui/pages/principal/activity/agents/agentViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../constants.dart';

class AgentPage extends StatelessWidget {
  const AgentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AgentViewModel>.reactive(
        builder: (context, model, child) => Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              color: Colors.grey[300],
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: model.postList.map((alerte) {
                        return PostCard(alerte);
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
        viewModelBuilder: () => AgentViewModel());
  }
}

class PostCard extends StatelessWidget {
  final Map postData;
  PostCard(this.postData);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          //height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //height: size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(12)),
                ),
                child: Container(
                  width: size.width,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.blueGrey,
                              child: Icon(
                                Icons.person,
                                size: 22,
                                color: Colors.white,
                              )),
                          SizedBox(width: 5),
                          Text(
                            ' Nom ',
                            style: TextStyle(
                              fontSize: 13,
                              //color: Colors.grey[500]
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: size.width * 0.3,
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            //color: kPrimaryColor,
                            border: Border.all(color: kPrimaryColor)),
                        child: Center(
                          child: Text(
                            postData['service'],
                            style: TextStyle(
                              fontSize: 10,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 4),
                child: Container(
                  child: Text(postData['message'],
                      maxLines: 2, style: GoogleFonts.notoSerif(fontSize: 14)),
                ),
              ),
              Container(
                height: size.height * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/accueil.png'),
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 8, 10, 5),
                height: 0.5,
                color: Colors.grey[400],
              ),
              Container(
                width: size.width,
                margin: EdgeInsets.fromLTRB(10, 3, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.place,
                          color: Colors.blueGrey,
                          size: 14,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: size.width * 0.4,
                          child: Text(
                            postData['position'],
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[850],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
