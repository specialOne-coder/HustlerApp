import 'package:flutter/material.dart';
import 'package:hustler/ui/pages/principal/message/contenu/contenuDiscussionViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../constants.dart';

class DiscussionContenuPage extends StatelessWidget {
  const DiscussionContenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<DiscussionContenuViewModel>.reactive(
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
                title: Text(
                  'Name',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      color: Colors.grey[300],
                      padding: EdgeInsets.only(bottom: 80),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: model.msgs.map((message) {
                          return MsgsCard(message);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              bottomSheet: Container(
                height: size.height * 0.08,
                decoration: BoxDecoration(color: Colors.grey[50], boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 3,
                      color: Colors.grey,
                      offset: Offset(0, 3))
                ]),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12, left: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 8, bottom: 8),
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    color: Colors.grey,
                                    offset: Offset(0, 0))
                              ]),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Entrer un message ...',
                                hintStyle: TextStyle(color: Colors.grey[500])),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 0,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Center(
                            child: Icon(
                              Icons.send_sharp,
                              size: 18,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(), backgroundColor: kPrimaryColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => DiscussionContenuViewModel());
  }
}

class MsgsCard extends StatelessWidget {
  final Map msgData;
  MsgsCard(this.msgData);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (msgData['emetteur'] == 'id2'
          ? EdgeInsets.only(left: 8, top: 10, right: 100, bottom: 5)
          : EdgeInsets.only(left: 100, top: 10, right: 8, bottom: 5)),
      child: Align(
        alignment: (msgData['emetteur'] == 'id2'
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: (msgData['emetteur'] == 'id2'
                  ? BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      //bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(8))
                  : BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    )),
              color: (msgData['emetteur'] == 'id2'
                  ? Colors.white
                  : kPrimaryColor)),
          padding: EdgeInsets.only(right: 15, left: 7, top: 5, bottom: 5),
          child: Text(
            msgData['msg'],
            style: TextStyle(
                fontSize: 15,
                color: (msgData['emetteur'] == 'id2'
                    ? Colors.black
                    : Colors.white)),
          ),
        ),
      ),
    );
  }
}
