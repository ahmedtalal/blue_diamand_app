import 'package:drinking_app/app/data/services/apis/auth_api_service.dart';
import 'package:drinking_app/app/domain/entities/auth_entity.dart';
import 'package:drinking_app/app/domain/repositories/i_auth_repository.dart';

class AuthRepositoryImp implements IAuthRepository {
  static final AuthRepositoryImp _authRepositoryImp =
      AuthRepositoryImp._internal();
  AuthRepositoryImp._internal();
  static AuthRepositoryImp get instance => _authRepositoryImp;

  @override
  bool checkIsLogin() {
    return AuthApiService.instance.checkIsUserLoginedService();
  }

  @override
  Future<Map<String, dynamic>> forgetPassword() {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> googleLogin() {
    // TODO: implement googleLogin
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> login(AuthEntity authEntity) async {
    return await AuthApiService.instance.loginApiService(authEntity);
  }

  @override
  Future<Map<String, dynamic>> phoneNumberLogin() {
    // TODO: implement phoneNumberLogin
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> register(AuthEntity authEntity) async {
    return await AuthApiService.instance.registerApiService(authEntity);
  }

  @override
  Future<Map<String, dynamic>> updatePassword() {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
}
