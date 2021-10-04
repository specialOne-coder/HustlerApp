import 'package:hustler/services/GetIt.dart';
import 'package:hustler/services/userService.dart';
import 'package:stacked/stacked.dart';

class InfosViewModel extends BaseViewModel {
  UserService userService = getIt.get<UserService>();

  String getPseudo(Map<String, dynamic> user) {
    print('pseudo : ${user['pseudo'].toString()}');
    return user['pseudo'].toString();
  }

  String getPictures(Map<String, dynamic> user) {
    print('pictures : ${user['pictures'].toString().isEmpty}');
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
}
