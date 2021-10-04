import 'dart:convert';

import '../constants.dart';
import 'package:http/http.dart' as http;

class AlerteService {
  var initUrl = server + '/alerte/';

  // les alertes
  Future<List<dynamic>> allAlertes() async {
    var client = http.Client();
    var url = Uri.parse(initUrl);
    try {
      var response = await client.get(url);
      //print('reponse : ${response.body}');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return [{}];
      }
    } catch (e) {
      print('Erreur : ${e.toString()}');
      return [
        {
          "alerteurId": "",
          "titre": "",
          "message": "",
          "service": "",
          "dateTaf": "",
          "picture": "",
          "position": "",
          "offersNumber": "",
          "prix": "",
          "status": ""
        }
      ];
    }
  }

  // les infos sur une alerte
  Future<Map<String, dynamic>> alerteInfos(id) async {
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
        "alerteurId": "",
        "titre": "",
        "message": "",
        "service": "",
        "dateTaf": "",
        "picture": "",
        "position": "",
        "offersNumber": "",
        "prix": "",
        "status": ""
      };
    }
  }
}
