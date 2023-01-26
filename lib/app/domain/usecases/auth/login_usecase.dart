import 'package:drinking_app/app/domain/entities/auth_entity.dart';
import 'package:drinking_app/app/domain/repositories/i_auth_repository.dart';

class LoginUseCase {
  static LoginUseCase? _loginUseCase;
  LoginUseCase._internal();
  static LoginUseCase instance() {
    if (_loginUseCase == null) {
      return _loginUseCase = LoginUseCase._internal();
    }
    return _loginUseCase!;
  }

  Future<Map<String, dynamic>> loginCall(
      AuthEntity authEntity, IAuthRepository iAuthRepository) async {
    return await iAuthRepository.login(authEntity);
  }
}

class AuthProvider {
  AuthProvider({required this.iAuthRepository});

  final IAuthRepository iAuthRepository;

  Future<Map<String, dynamic>> authLoginProvider(AuthEntity authEntity) {
    return iAuthRepository.login(authEntity);
  }
}
