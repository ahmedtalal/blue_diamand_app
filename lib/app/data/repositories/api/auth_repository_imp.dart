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
  Future<Map<String, dynamic>> forgetPassword(var data) async {
    return await AuthApiService.instance.forgetPasswordApiService(data);
  }

  @override
  Future<Map<String, dynamic>> googleLogin() {
    // TODO: implement googleLogin
    throw UnimplementedError();
  }

  @override
  Future<bool> logOut() async {
    return await AuthApiService.instance.logoutApiService();
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
  Future<Map> register(AuthEntity authEntity) async {
    return await AuthApiService.instance.registerApiService(authEntity);
  }

  @override
  Future<Map<String, dynamic>> updatePassword(var data) async {
    return await AuthApiService.instance.changePaswordApiService(data: data);
  }
}
