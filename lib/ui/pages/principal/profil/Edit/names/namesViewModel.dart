import 'package:hustler/services/GetIt.dart';
import 'package:hustler/services/userService.dart';
import 'package:stacked/stacked.dart';

class NamesViewModel extends BaseViewModel {
  UserService userService = getIt.get<UserService>();

  String getPseudo(Map<String, dynamic> user) {
    print('pseudo : ${user['pseudo'].toString()}');
    return user['pseudo'].toString();
  }
}
