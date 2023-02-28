import 'package:drinking_app/app/domain/entities/residential_address.dart';
import 'package:drinking_app/app/domain/entities/work_address.dart';

class AuthEntity {
  String? fullName;
  String? email;
  String? password;
  String? username;
  String? birthdate;
  String? emiratesID;
  String? nationality;
  String? emiratesCity;
  String? area;
  String? callNumber;
  String? whatsappNumber;
  WorkAddress? workAddress;
  ResidentailAddress? residentailAddress;

  AuthEntity({
    this.fullName,
    this.email,
    this.password,
    this.username,
    this.birthdate,
    this.emiratesID,
    this.nationality,
    this.emiratesCity,
    this.area,
    this.callNumber,
    this.whatsappNumber,
    this.workAddress,
    this.residentailAddress,
  });
}
