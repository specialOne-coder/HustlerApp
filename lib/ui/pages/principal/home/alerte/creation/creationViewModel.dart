import 'package:flutter/material.dart';
import 'package:hustler/services/GetIt.dart';
import 'package:hustler/services/alerteService.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:stacked/stacked.dart';

class AlerteCreationViewModel extends BaseViewModel {
  List alerte = [
    {
      'service': "Travaux domicile ",
      'titre': "Amenagement",
      'message':
          "Bonjour , je cherche de l'aide pour amenager dans une new house ",
      'photo': '/assets/radison.jpg',
      'dateTaf': "Aujourd'hui",
      'offreNbre': "5",
      'dateAjout': "21 mars 2021",
      'position': 'Quartier general , Lomé , vers doganto',
      'prix': '5000',
    }
  ];

  String alerteurId = '';
  String titre = "";
  String picture = '';
  String email = '';
  String message = '';
  String service = '';
  String dateAjout = '';
  String dateTaf = '';
  String position = '';
  String offersNumber = '';
  String prix = '';
  String status = '';
  String convert = "";
  List listItem = [
    "Informatique",
    "Travaux domiciles",
    "Plomberie",
    "Menuserie",
    "Mecanique",
    "Sport",
    "Game",
    "Reparation",
    "Enseignement"
  ];

  onDateChanged(DateTime date) {
    this.dateTaf = date.toString();
  }

  AlerteService alerteService = getIt.get<AlerteService>();
  final formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  setState(newChoix) => {
        this.service = newChoix,
        this.notifyListeners(),
      };
}
