import 'package:get_it/get_it.dart';
import 'package:hustler/services/alerteService.dart';
import 'package:hustler/services/authService.dart';
import 'package:hustler/services/userService.dart';

GetIt getIt = GetIt.instance;

setup() {
  getIt.registerLazySingleton(() => AuthService());
  getIt.registerLazySingleton(() => UserService());
  getIt.registerLazySingleton(() => AlerteService());
}
