import 'package:flutter/material.dart';
import 'package:hustler/services/GetIt.dart';
import 'package:hustler/services/authService.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:stacked/stacked.dart';

class CompleteViewModel extends BaseViewModel {
  String choix = "";
  String pseudo = "";
  String email = "";
  String userType = "";
  String password = "";
  List listItem = [
    "Client , j'ai bésoin d'aide",
    "Agent , promouvoir mes services"
  ];
  var details = {"client", "agent"};

  AuthService authService = getIt.get<AuthService>();
  final formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  setState(newChoix) => {this.choix = newChoix, this.notifyListeners()};
}
