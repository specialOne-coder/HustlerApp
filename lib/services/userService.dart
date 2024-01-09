import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:hustler/ui/pages/connexion/ModifyPassword/modifyPage.dart';
import 'package:hustler/ui/pages/connexion/login/loginPage.dart';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

// ignore: slash_for_doc_comments
/**
 *  User Service class
 */

class UserService {
  var initUrl = server + '/user/';
  // decoded token
  Future decodedToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('jwt');
    if (token != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      print('decodedToken : ${decodedToken.toString()}');
      DateTime expirationDate = JwtDecoder.getExpirationDate(token);
      print('expirationDate : ${expirationDate.toString()}');
    } else {
      print('Aucun token');
    }
    return decodedToken;
  }

  // Infos de l'utilisateur
  Future<Map<String, dynamic>> userInfos() async {
    var client = http.Client();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('jwt');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
    var url = Uri.parse(initUrl + decodedToken['id']);
    try {
      var response = await client.get(url);
      print('reponse : ${response.body}');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {};
      }
    } catch (e) {
      print('Erreur : ${e.toString()}');
      return {
        "pseudo": "",
        "pictures": "",
        "phone": "",
        "bio": "",
        "adresse": "",
        "genre": "",
        "userType": "",
        "email": "",
        "Dnaissance": ""
      };
    }
  }

  // Mise à jour des informations de l'utilisateur
  Future updateUser(pseudo, name, bio, phone, adresse, pictures, genre,
      dnaissance, context) async {
    var client = http.Client();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('jwt');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
    try {
      var url = Uri.parse(initUrl + 'update/' + decodedToken['id']);
      var response = await client.put(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'pseudo': pseudo,
        'name': name,
        'bio': bio,
        'phone': phone,
        'adresse': adresse,
        'pictures': pictures,
        'genre': genre,
        'Dnaissance': dnaissance,
      });
      print(response.body);
      if (response.statusCode == 200) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.topSlide,
          title: 'Success',
          desc: 'Informations mises à jour ',
          btnOkOnPress: () {},
        )..show();
      } else if (response.statusCode == 300) {
        final parsed = jsonDecode(response.body);
        AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.topSlide,
          title: 'Erreur',
          desc: '${parsed["pseudo"] + parsed["email"] + parsed["phone"]} ',
          btnCancelOnPress: () {},
        )..show();
      }
    } catch (e) {
      print('Erreur : ${e.toString()}');
      AwesomeDialog(
        context: context,
        dialogType: DialogType.noHeader,
        animType: AnimType.topSlide,
        title: 'Erreur',
        desc: 'Connection Error ',
        btnCancelOnPress: () {},
      )..show();
    } finally {
      client.close();
    }
  }

  // Vérification et envoi du nouveau mot de passe
  Future newEmailCode(email, context) async {
    var client = http.Client();
    try {
      var url = Uri.parse(initUrl + 'newEmailCode');
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
      } else if (response.statusCode == 400) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.topSlide,
          title: 'Erreur',
          desc: 'Ce email existe déja',
          btnCancelOnPress: () {},
        )..show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.topSlide,
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

  // Reinitialisation du mot de passe
  Future updateEmail(code, newEmail, context) async {
    var client = http.Client();
    try {
      var url = Uri.parse(initUrl + 'updatePass');
      var response = await client.put(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'verifiedCode': code,
        'newEmail': newEmail
      });
      print(response.body);
      if (response.statusCode == 200) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.topSlide,
          title: 'Success',
          desc: 'votre email a été mise à jour ',
          btnOkOnPress: () {},
        )..show();
      } else if (response.statusCode == 300) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.topSlide,
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

  Future updatePassword(email, oldPassword, newPassword, context) async {
    var client = http.Client();

    try {
      var url = Uri.parse(initUrl + 'modifyPass');
      var response = await client.put(url, headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      }, body: <String, String>{
        'email': email,
        'oldPass': oldPassword,
        'newPass': newPassword
      });
      print(response.body);
      if (response.statusCode == 200) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.topSlide,
          title: 'Success',
          desc: 'votre mot de passe a été mis à jour  ',
          btnOkOnPress: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
          },
        )..show();
      } else if (response.statusCode == 300) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.topSlide,
          title: 'Erreur',
          desc: 'Incorrect password ',
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

  // logout
  Future logout(context) async {
    Fluttertoast.showToast(
        msg: "Patientez ... ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('jwt');
    var tokenExist = prefs.getString('jwt');
    print('token ? : ${tokenExist.toString()}');
    if (tokenExist == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      Fluttertoast.showToast(
          msg: "Réessayer ... ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    //print('token.delete ? : ${token.toString()}');
  }

  // informations sur un autre utilisateur
  Future<Map<String, dynamic>> otherUserInfos(id) async {
    var client = http.Client();
    var url = Uri.parse(initUrl + id);
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {};
      }
    } catch (e) {
      print('Erreur : ${e.toString()}');
      return {
        "pseudo": "",
        "pictures": "",
        "phone": "",
        "bio": "",
        "adresse": "",
        "genre": "",
        "userType": "",
        "email": "",
        "Dnaissance": ""
      };
    }
  }

  // upload image
  Future<dynamic> uploadFile(filePath, name) async {
    var client = http.Client();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('jwt');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
    var userId = decodedToken['id'];
    try {
      var url = Uri.parse(initUrl + 'upload');
      var request = http.MultipartRequest('POST', url);
      request.fields.addAll({'userId': userId, 'name': name});
      request.files.add(http.MultipartFile.fromBytes(
          'file', File(filePath).readAsBytesSync(),
          filename: filePath.split("/").last));
      var response = await request.send();
      var vraiResponse = await http.Response.fromStream(response);
      print('response looo : ${vraiResponse.body}');
      return vraiResponse;
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
  // creation d'une alerte

}
