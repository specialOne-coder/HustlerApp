import 'package:flutter/material.dart';
import 'package:hustler/ui/pages/principal/activity/activity.dart';
import 'package:hustler/ui/pages/principal/home/dash/homePage.dart';
import 'package:hustler/constants.dart';
import 'package:hustler/ui/pages/principal/message/discussions/discussionPage.dart';
import 'package:hustler/ui/pages/principal/profil/profilPage/profilPage.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Activity(),
    DiscussionPage(),
    ProfilPage(),
  ];

  void onItemTap(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  //userService() async => {await UserService().userInfos()};

  @override
  Widget build(BuildContext context) {
    //userService();
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(selectIndex)),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        fixedColor: kPrimaryColor,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Accueil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.attractions), label: 'Activités'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin), label: 'Profil'),
        ],
        currentIndex: selectIndex,
        onTap: onItemTap,
      ),
    );
  }
}
