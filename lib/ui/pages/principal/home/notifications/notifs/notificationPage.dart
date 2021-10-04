import 'package:flutter/material.dart';
import 'package:hustler/ui/pages/principal/home/notifications/list/notifList.dart';
import 'package:hustler/ui/pages/principal/home/notifications/notifs/notificationViewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../constants.dart';
import '../nothingNot.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<NotificationViewModel>.reactive(
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
                title: Text(
                  'Notifications',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                centerTitle: true,
              ),
              body: Container(
                  height: size.height,
                  child: (model.notification)
                      // ignore: dead_code
                      ? SingleChildScrollView(child: NotifList())
                      : Center(child: NothingNot())),
            ),
        viewModelBuilder: () => NotificationViewModel());
  }
}
