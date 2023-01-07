import 'package:drinking_app/app/domain/entities/auth_entity.dart';
import 'package:drinking_app/app/domain/repositories/i_auth_repository.dart';

class AuthRepositoryImp implements IAuthRepository {
  static final AuthRepositoryImp _authRepositoryImp =
      AuthRepositoryImp._internal();
  AuthRepositoryImp._internal();
  static AuthRepositoryImp get instance => _authRepositoryImp;
  @override
  Future<Map<String, dynamic>> checkIsLogin() {
    // TODO: implement checkIsLogin
    throw UnimplementedError();
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
  Future<Map<String, dynamic>> login(AuthEntity authEntity) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> phoneNumberLogin() {
    // TODO: implement phoneNumberLogin
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> register(AuthEntity authEntity) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> updatePassword() {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
}
