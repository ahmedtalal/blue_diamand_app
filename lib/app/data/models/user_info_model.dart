import 'package:drinking_app/app/domain/entities/user_entity.dart';

class UserInfoModel extends UserEntity {
  UserInfoModel({
    super.user,
    super.message,
  });

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
