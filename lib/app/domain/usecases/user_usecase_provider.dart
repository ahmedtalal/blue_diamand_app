import 'package:drinking_app/app/domain/repositories/i_user_repository.dart';

class UserUseCaseProvider {
  static UserUseCaseProvider? _provider;
  UserUseCaseProvider._internal();
  static UserUseCaseProvider instance() {
    if (_provider == null) {
      return _provider = UserUseCaseProvider._internal();
    }
    return _provider!;
  }

  IUserRepository creator<IUserRepository>(IUserRepository repository) =>
      repository;
}
