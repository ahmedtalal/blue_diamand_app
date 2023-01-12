import 'package:drinking_app/app/domain/entities/auth_entity.dart';
import 'package:drinking_app/app/domain/repositories/i_auth_repository.dart';

class RegisterUseCase {
  static final RegisterUseCase _registerUseCase = RegisterUseCase._internal();
  RegisterUseCase._internal();
  static RegisterUseCase get instance => _registerUseCase;

  Future<Map<String, dynamic>> registerCall(
      AuthEntity authEntity, IAuthRepository iAuthRepository) async {
    return await iAuthRepository.register(authEntity);
  }
}
