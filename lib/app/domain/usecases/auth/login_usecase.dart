import 'package:drinking_app/app/domain/entities/auth_entity.dart';
import 'package:drinking_app/app/domain/repositories/i_auth_repository.dart';

class LoginUseCase {
  static final LoginUseCase _loginUseCase = LoginUseCase._internal();
  LoginUseCase._internal();
  static LoginUseCase get instance => _loginUseCase;

  Future<Map<String, dynamic>> loginCall(
      AuthEntity authEntity, IAuthRepository iAuthRepository) async {
    return await iAuthRepository.login(authEntity);
  }
}
