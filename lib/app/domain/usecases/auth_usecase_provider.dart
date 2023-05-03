import 'package:drinking_app/app/domain/repositories/i_auth_repository.dart';

class AuthUseCaseProvider {
  static AuthUseCaseProvider? _authCaseProvider;
  AuthUseCaseProvider._internal();
  static AuthUseCaseProvider instance() {
    if (_authCaseProvider == null) {
      return _authCaseProvider = AuthUseCaseProvider._internal();
    }
    return _authCaseProvider!;
  }

  IAuthRepository creator<IAuthRepository>(IAuthRepository repository) {
    return repository;
  }
}
