import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hustler/services/GetIt.dart';
import 'package:hustler/ui/pages/firstPage.dart';

import 'constants.dart';

void main() => {
      WidgetsFlutterBinding.ensureInitialized(),
      setup(),
      HttpOverrides.global = new MyHttpOverrides(),
      runApp(MyApp())
    };

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hustler',
        navigatorKey: Get.key,
        navigatorObservers: [GetObserver()],
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: FirstPage());
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
