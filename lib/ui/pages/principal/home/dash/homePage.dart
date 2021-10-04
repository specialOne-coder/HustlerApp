import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hustler/services/userService.dart';
import 'package:hustler/ui/pages/principal/home/alerte/alerteCreation.dart';
import 'package:hustler/ui/pages/principal/home/alerte/list/alerteList.dart';
import 'package:hustler/ui/pages/principal/home/notifications/notifs/notificationPage.dart';
import 'package:hustler/ui/pages/principal/home/postAgent/postCreation.dart';
import 'package:stacked/stacked.dart';

import '../../../../../constants.dart';
import 'homeViewModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: MyAppBar(),
              body: Container(
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(50.0),
                      topRight: const Radius.circular(50.0),
                    ),
                    color: Colors.grey[300]),
                height: size.height,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    AlerteList(),
                  ],
                )),
              ),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}

// AppBar
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);
  static const String userType = "client";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: UserService().userInfos(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return AppBar(
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: kPrimaryColor,
                ),
                onPressed: () {
                  (userType == 'client')
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AlerteCreation(),
                              settings: RouteSettings(
                                  arguments: snapshot.data['_id'])))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PostCreation()));
                },
              ),
              title: Text('Hustler',
                  style: GoogleFonts.nunito(
                      color: kPrimaryColor, fontWeight: FontWeight.bold)),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.notifications_none_rounded,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationPage()));
                  },
                ),
              ],
              backgroundColor: Colors.white,
              centerTitle: true,
            );
          if (snapshot.data == null) {
            return Text('');
          } else {
            return AppBar(
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: kPrimaryColor,
                ),
                onPressed: () {
                  (userType == 'client')
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AlerteCreation(),
                              settings: RouteSettings(
                                  arguments: snapshot.data['_id'])))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PostCreation()));
                },
              ),
              title: Text('Hustler',
                  style: GoogleFonts.nunito(
                      color: kPrimaryColor, fontWeight: FontWeight.bold)),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.notifications_none_rounded,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationPage()));
                  },
                ),
              ],
              backgroundColor: Colors.white,
              centerTitle: true,
            );
          }
        });
  }
}
