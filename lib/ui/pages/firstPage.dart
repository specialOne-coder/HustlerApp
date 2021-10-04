import 'package:flutter/material.dart';
import 'package:hustler/ui/pages/accueil/accueil.dart';
import 'package:hustler/ui/pages/principal/menu.dart';
import 'package:hustler/ui/pages/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late final Future<dynamic> storedFuture;

  Future getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('jwt');
    print('jwt : ${token.toString()}');
    print('test : ${token.toString().isEmpty}');
    return token;
  }

  @override
  void initState() {
    super.initState();
    storedFuture = getToken();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: storedFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return SplashScreen();
          if (snapshot.hasData) {
            return Menu();
          } else {
            return Accueil();
          }
        });
  }
}
