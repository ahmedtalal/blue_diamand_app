import 'package:drinking_app/app/data/services/apis/user_api_services.dart';
import 'package:drinking_app/app/domain/repositories/i_user_repository.dart';

class UserRepositoryImp implements IUserRepository {
  static UserRepositoryImp? _userRepositoryImp;
  UserRepositoryImp._internal();
  static UserRepositoryImp instance() {
    if (_userRepositoryImp == null) {
      return _userRepositoryImp = UserRepositoryImp._internal();
    }
    return _userRepositoryImp!;
  }

  @override
  deleteUserModel(model) {
    // TODO: implement deleteUserModel
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserModel(var model) async {
    return await UserApiServices.instance().getUserModelService(model);
  }

  @override
  updateUserModel(model) {
    // TODO: implement updateUserModel
    throw UnimplementedError();
  }

  @override
  getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }
}
