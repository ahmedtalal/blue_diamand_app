import 'package:drinking_app/app/domain/entities/auth_entity.dart';
import 'package:drinking_app/app/domain/entities/residential_address.dart';
import 'package:drinking_app/app/domain/entities/work_address.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    super.fullName,
    super.email,
    super.password,
    super.username,
    super.birthdate,
    super.emiratesID,
    super.nationality,
    super.emiratesCity,
    super.area,
    super.callNumber,
    super.whatsappNumber,
    super.workAddress,
    super.residentailAddress,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      fullName: json['fullName'],
      email: json['email'],
      password: json['password'],
      username: json['username'],
      birthdate: json['birthdate'],
      emiratesID: json['emiratesID'],
      nationality: json['nationality'],
      emiratesCity: json['emiratesCity'],
      area: json['area'],
      callNumber: json['callNumber'],
      whatsappNumber: json['whatsappNumber'],
      workAddress: WorkAddress.fromJson(json['workAddress']),
      residentailAddress:
          ResidentailAddress.fromJson(json['residentailAddress']),
    );
  }

  static Map<String, dynamic> toJson(AuthEntity model) {
    return {
      'fullName': model.fullName,
      'email': model.email,
      'password': model.password,
      'username': model.username,
      'birthdate': model.birthdate,
      'emiratesID': model.emiratesID,
      'nationality': model.nationality,
      'emiratesCity': model.emiratesCity,
      'area': model.area,
      'callNumber': model.callNumber,
      'whatsappNumber': model.whatsappNumber,
      'workAddress': WorkAddress.toJson(model.workAddress!),
      'residentailAddress':
          ResidentailAddress.toJson(model.residentailAddress!),
    };
  }
}
