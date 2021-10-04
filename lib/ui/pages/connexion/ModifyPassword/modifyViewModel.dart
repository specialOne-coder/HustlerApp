import 'package:flutter/material.dart';
import 'package:hustler/services/GetIt.dart';
import 'package:hustler/services/authService.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:stacked/stacked.dart';

class ModifyViewModel extends BaseViewModel {
  int code = 0;
  String newPassword = '';
  String convert = '';
  final formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController btnController2 =
      RoundedLoadingButtonController();
  AuthService authService = getIt.get<AuthService>();
  refresh() => {this.notifyListeners()};
}
