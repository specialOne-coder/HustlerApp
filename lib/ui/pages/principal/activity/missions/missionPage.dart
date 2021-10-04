import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hustler/ui/pages/principal/activity/missions/missionViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../constants.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MissionViewModel>.reactive(
        builder: (context, model, child) => Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              //color: Colors.grey[300],
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: model.activities.map((activity) {
                        return MissionCard(activity);
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
        viewModelBuilder: () => MissionViewModel());
  }
}

class MissionCard extends StatelessWidget {
  final Map misssionData;
  MissionCard(this.misssionData);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Container(
                    width: size.width,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            radius: 20,
                            backgroundColor: kPrimaryColor,
                            child: Icon(
                              Icons.local_activity,
                              size: 22,
                              color: Colors.white,
                            )),
                        SizedBox(width: 5),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              misssionData['titre'],
                              style: TextStyle(
                                fontSize: 15,
                                //color: Colors.grey[500]
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              //color: kPrimaryColor,
                              width: size.width * 0.65,
                              padding: EdgeInsets.only(top: 5),
                              child: Text(misssionData['cmessage'],
                                  maxLines: 2,
                                  style: GoogleFonts.notoSerif(
                                      fontSize: 13, color: Colors.grey[800])),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 8, 10, 5),
                  height: 0.5,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
