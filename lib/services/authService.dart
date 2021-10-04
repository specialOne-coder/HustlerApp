import 'dart:async';
import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:hustler/constants.dart';
import 'package:hustler/ui/pages/connexion/ModifyPassword/modifyPage.dart';
import 'package:hustler/ui/pages/connexion/login/loginPage.dart';
import 'package:hustler/ui/pages/inscription/verified/verifiedPage.dart';
import 'package:hustler/ui/pages/principal/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  int statusCode = 0;
  bool success = false;
  var initUrl = server + '/user/';

  // ignore: slash_for_doc_comments
  /**
   * Fonction du login
   */
  Future login(email, password, context) async {
    var client = http.Client();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var url = Uri.parse(initUrl + 'login');
      var response = await client.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'email': email,
        'password': password
      });
      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        await prefs.setString('jwt', parsed['token']);
        Timer(Duration(seconds: 3), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Menu()));
        });
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.NO_HEADER,
          animType: AnimType.TOPSLIDE,
          title: 'Erreur',
          desc: 'Invalid username or password ',
          btnCancelOnPress: () {},
        )..show();
      }
    } catch (e) {
      print('Erreur ${e.toString()}');
      Fluttertoast.showToast(
          msg: "Connection Error ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } finally {
      client.close();
    }
  }

  // oublie de mot de passe
  Future forgetPass(email, context) async {
    var client = http.Client();
    try {
      var url = Uri.parse(initUrl + 'forget');
      var response = await client.put(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'email': email,
      });
      print(response.body);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "un code de verification vous a été envoyé ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Timer(Duration(seconds: 2), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ModifyPage(),
                  settings: RouteSettings(arguments: email)));
        });
      } else if (response.statusCode == 300) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.NO_HEADER,
          animType: AnimType.TOPSLIDE,
          title: 'Erreur',
          desc: 'Invalid email ',
          btnCancelOnPress: () {},
        )..show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.NO_HEADER,
          animType: AnimType.TOPSLIDE,
          title: 'Erreur',
          desc: 'Email connection Error ',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        )..show();
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: " Connection Error   ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } finally {
      client.close();
    }
  }

  // Renvoi du mail de reinitialisation
  Future resendForgetCode(email) async {
    var client = http.Client();
    try {
      var url = Uri.parse(initUrl + 'resendForget');
      var response = await client.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'email': email,
      });
      print(response.body);
      if (response.statusCode == 200) {
        this.success = true;
        Fluttertoast.showToast(
            msg: "un code de verification vous a été envoyé ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 300) {
        this.success = false;
        Fluttertoast.showToast(
            msg: "Erreur",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Timer(Duration(seconds: 1), () {
          this.success = false;
          Fluttertoast.showToast(
              msg: "Erreur d'envoi du mail , reessayer",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      }
    } catch (e) {
      print('Erreur : ${e.toString()})');
      Fluttertoast.showToast(
          msg: " Connection Error   ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } finally {
      client.close();
    }
  }

  // Reinitialisation du mot de passe
  Future updatePass(code, newPassword, context) async {
    var client = http.Client();
    try {
      var url = Uri.parse(initUrl + 'updatePass');
      var response = await client.put(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'forgetCode': code,
        'newPassword': newPassword
      });
      print(response.body);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: " Votre mot de passe a été reinitialisé ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Timer(Duration(seconds: 2), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
        });
      } else if (response.statusCode == 300) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.NO_HEADER,
          animType: AnimType.TOPSLIDE,
          title: 'Erreur',
          desc: 'Incorrect code ',
          btnCancelOnPress: () {},
        )..show();
      }
    } catch (e) {
      print('Erreur : ${e.toString()}');
      Fluttertoast.showToast(
          msg: " Connection Error   ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } finally {
      client.close();
    }
  }

  // ignore: slash_for_doc_comments
  /**
   *  Register
   */

  // Inscription
  Future register(pseudo, email, userType, password, context) async {
    var client = http.Client();
    try {
      var url = Uri.parse(initUrl + 'register');
      var response = await client.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'pseudo': pseudo,
        'email': email,
        'userType': userType,
        'password': password
      });
      print(response.body);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "un code de verification vous a été envoyé ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Timer(Duration(seconds: 2), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => VerifiedPage(),
                  settings: RouteSettings(arguments: email)));
        });
      } else if (response.statusCode == 300) {
        final parsed = jsonDecode(response.body);
        AwesomeDialog(
          context: context,
          dialogType: DialogType.NO_HEADER,
          animType: AnimType.TOPSLIDE,
          title: 'Erreur',
          desc: '${parsed["pseudo"] + parsed["email"] + parsed["password"]} ',
          btnCancelOnPress: () {},
        )..show();
      } else {
        this.success = false;
        Fluttertoast.showToast(
            msg: "Erreur d'envoi du mail , reessayer",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Connection Error ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print('Erreur ${e.toString()}');
    } finally {
      client.close();
    }
  }

  // Renvoi du mail de verification
  Future resendVerifiedCode(email) async {
    var client = http.Client();
    try {
      var url = Uri.parse(initUrl + 'resend');
      var response = await client.post(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'email': email,
      });
      print(response.body);
      if (response.statusCode == 200) {
        this.success = true;
        Fluttertoast.showToast(
            msg: "un code de verification vous a été envoyé ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (response.statusCode == 300) {
        this.success = false;
        Fluttertoast.showToast(
            msg: "Erreur",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        this.success = false;
        Timer(Duration(seconds: 1), () {
          Fluttertoast.showToast(
              msg: "Erreur d'envoi du mail , reessayer",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      }
    } catch (e) {
      print('Erreur : ${e.toString()})');
      Fluttertoast.showToast(
          msg: " Connection Error   ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } finally {
      client.close();
    }
  }

  // Reinitialisation du mot de passe
  Future veried(code, context) async {
    var client = http.Client();
    try {
      var url = Uri.parse(initUrl + 'verified');
      var response = await client.put(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'verifiedCode': code,
      });
      print(response.body);
      if (response.statusCode == 200) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
      } else if (response.statusCode == 300) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.NO_HEADER,
          animType: AnimType.TOPSLIDE,
          title: 'Erreur',
          desc: 'Incorrect code ',
          btnCancelOnPress: () {},
        )..show();
      } else {
        Timer(Duration(seconds: 1), () {
          Fluttertoast.showToast(
              msg: "Erreur , reessayer",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      }
    } catch (e) {
      print('Erreur : ${e.toString()}');
      Fluttertoast.showToast(
          msg: " Connection Error   ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } finally {
      client.close();
    }
  }
}
