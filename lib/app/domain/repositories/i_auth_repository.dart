import 'package:drinking_app/app/domain/entities/auth_entity.dart';

abstract class IAuthRepository {
  dynamic login(AuthEntity authEntity);
  dynamic register(AuthEntity authEntity);
  dynamic forgetPassword(var data);
  dynamic updatePassword(Map<String, dynamic> data);
  dynamic googleLogin();
  dynamic phoneNumberLogin();
  dynamic logOut();
  dynamic checkIsLogin();
}
