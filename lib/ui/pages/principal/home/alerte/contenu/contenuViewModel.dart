import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class ContenuViewModel extends BaseViewModel {
  Future<Map<String, dynamic>> verifyIdentity(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('jwt');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
    if (id == decodedToken['id']) {
      return {'message': 'true'};
    } else {
      return {'message': 'false'};
    }
  }
}
