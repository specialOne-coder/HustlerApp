import 'package:flutter/material.dart';
import 'package:hustler/services/GetIt.dart';
import 'package:hustler/services/authService.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  String email = '';
  String password = '';
  final formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  AuthService authService = getIt.get<AuthService>();

  constructor(String em, String pa) {
    this.email = em;
    this.password = pa;
  }

  refresh() => {this.notifyListeners()};
}
