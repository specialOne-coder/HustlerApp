import 'package:flutter/material.dart';
import 'package:hustler/services/GetIt.dart';
import 'package:hustler/services/userService.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:stacked/stacked.dart';

class InformationsViewModel extends BaseViewModel {
  String userId = '';
  String pseudo = "";
  String pictures = '';
  String email = '';
  String userType = '';
  String adresse = '';
  String bio = '';
  String phone = '';
  String dNaissance = '';
  String genre = '';
  String name = '';
  String convert = '';
  String password = '';
  String confirmNewPass = '';
  String newPassword = '';
  String choix = "";
  List listItem = ["Homme", "Femme", "Non Spécifié"];

  setState(newChoix) {
    this.choix = newChoix;
    this.notifyListeners();
  }

  onDateChanged(DateTime date) {
    this.dNaissance = date.toString();
  }

  final formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  UserService userService = getIt.get<UserService>();

  String getPseudo(Map<String, dynamic> user) {
    return user['pseudo'].toString();
  }

  String getPictures(Map<String, dynamic> user) {
    return user['pictures'].toString();
  }

  String getAdresse(Map<String, dynamic> user) {
    return user['adresse'].toString();
  }

  String getBio(Map<String, dynamic> user) {
    return user['bio'].toString();
  }

  String getCreationDate(Map<String, dynamic> user) {
    if (user['createdAt'] == null) {
      return '';
    } else {
      print('Test : ${user['createdAt'].toString()}');
      String dateWithT = user['createdAt'].substring(0, 10);
      return dateWithT;
    }
  }

  String getGenre(Map<String, dynamic> user) {
    return user['genre'].toString();
  }

  String getEmail(Map<String, dynamic> user) {
    return user['email'].toString();
  }

  String getPhone(Map<String, dynamic> user) {
    return user['phone'].toString();
  }

  String getDnaissance(Map<String, dynamic> user) {
    if (user['Dnaissance'] == null) {
      return '';
    } else {
      print('Test : ${user['createdAt'].toString()}');
      String dateWithT = user['Dnaissance'].substring(0, 10);
      return dateWithT;
    }
  }

  String getName(Map<String, dynamic> user) {
    return user['name'].toString();
  }
}
