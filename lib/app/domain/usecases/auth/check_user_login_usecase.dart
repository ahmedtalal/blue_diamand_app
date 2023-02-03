import 'package:drinking_app/app/data/repositories/api/auth_repository_imp.dart';

class CheckUserLoginUserCase {
  static CheckUserLoginUserCase? _checkUserLoginUserCase;
  CheckUserLoginUserCase._internal();
  static CheckUserLoginUserCase instance() {
    if (_checkUserLoginUserCase == null) {
      return _checkUserLoginUserCase = CheckUserLoginUserCase._internal();
    }
    return _checkUserLoginUserCase!;
  }

  bool call() {
    return AuthRepositoryImp.instance.checkIsLogin();
  }
}
