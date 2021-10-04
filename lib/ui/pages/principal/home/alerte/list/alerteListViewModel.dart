import 'package:hustler/services/GetIt.dart';
import 'package:hustler/services/alerteService.dart';
import 'package:stacked/stacked.dart';

class AlerteListViewModel extends BaseViewModel {
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
  String choix = "";

  setState(newChoix) {
    this.choix = newChoix;
    this.notifyListeners();
  }

  onDateChanged(DateTime date) {
    this.dateTaf = date.toString();
  }

  AlerteService alerteService = getIt.get<AlerteService>();

  String getAlerteurId(Map<String, dynamic> alerte) {
    return alerte['alerteurId'].toString();
  }

  String getPicture(Map<String, dynamic> alerte) {
    return alerte['picture'].toString();
  }

  String getTitre(Map<String, dynamic> alerte) {
    return alerte['titre'].toString();
  }

  String getMessage(Map<String, dynamic> alerte) {
    return alerte['message'].toString();
  }

  String getCreationDate(Map<String, dynamic> alerte) {
    if (alerte['createdAt'] == null) {
      return '';
    } else {
      String dateCreation = alerte['createdAt'].substring(0, 10);
      return dateCreation;
    }
  }

  String getService(Map<String, dynamic> alerte) {
    return alerte['service'].toString();
  }

  String getDateTaf(Map<String, dynamic> alerte) {
    if (alerte['dateTaf'] == null) {
      return '';
    } else {
      String dateTaf = alerte['dateTaf'].substring(0, 10);
      return dateTaf;
    }
  }

  String getPosition(Map<String, dynamic> alerte) {
    return alerte['position'].toString();
  }

  String getOffersNumber(Map<String, dynamic> alerte) {
    return alerte['offersNumber'].toString();
  }

  String getPrice(Map<String, dynamic> alerte) {
    return alerte['prix'].toString();
  }

  String getStatus(Map<String, dynamic> alerte) {
    return alerte['status'].toString();
  }
}
