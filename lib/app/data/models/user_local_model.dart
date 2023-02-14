import 'package:drinking_app/app/domain/entities/user_local_entity.dart';

class UserLocalModel extends UserLocalEntity {
  UserLocalModel({
    super.userToken,
    super.userExpire,
    super.userId,
  });

  factory UserLocalModel.fromJson(var json) {
    return UserLocalModel(
      userToken: json["token"],
      userExpire: json["expiresIn"],
      userId: json["userId"],
    );
  }

  static Map<String, dynamic> toJson(UserLocalModel model) {
    return {
      "token": model.userToken,
      "expiresIn": model.userExpire,
      "userId": model.userId,
    };
  }
}
