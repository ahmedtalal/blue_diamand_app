import 'package:drinking_app/app/domain/entities/auth_entity.dart';

abstract class IAuthRepository {
  Future<Map<String, dynamic>> login(AuthEntity authEntity);
  Future<Map<String, dynamic>> register(AuthEntity authEntity);
  Future<Map<String, dynamic>> forgetPassword();
  Future<Map<String, dynamic>> updatePassword();
  Future<Map<String, dynamic>> googleLogin();
  Future<Map<String, dynamic>> phoneNumberLogin();
  Future<Map<String, dynamic>> logOut();
  Future<Map<String, dynamic>> checkIsLogin();
}
