class UserEntity {
  String? message;
  User? user;
  UserEntity({
    user,
    message,
  });
}

class User {
  String? sId;
  String? fullName;
  String? emiratesID;
  String? nationality;
  String? callNumber;
  String? whatsappNumber;
  String? email;
  String? username;
  String? password;
  String? birthdate;
  String? emiratesCity;
  String? area;
  ResidentailAddress? residentailAddress;
  WorkAddress? workAddress;
  bool? isAdmin;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {sId,
      fullName,
      emiratesID,
      nationality,
      callNumber,
      whatsappNumber,
      email,
      username,
      password,
      birthdate,
      emiratesCity,
      area,
      residentailAddress,
      workAddress,
      isAdmin,
      createdAt,
      updatedAt,
      iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    emiratesID = json['emiratesID'];
    nationality = json['nationality'];
    callNumber = json['callNumber'];
    whatsappNumber = json['whatsappNumber'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    birthdate = json['birthdate'];
    emiratesCity = json['emiratesCity'];
    area = json['area'];
    residentailAddress = json['residentailAddress'] != null
        ? ResidentailAddress.fromJson(json['residentailAddress'])
        : null;
    workAddress = json['workAddress'] != null
        ? WorkAddress.fromJson(json['workAddress'])
        : null;
    isAdmin = json['isAdmin'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['fullName'] = fullName;
    data['emiratesID'] = emiratesID;
    data['nationality'] = nationality;
    data['callNumber'] = callNumber;
    data['whatsappNumber'] = whatsappNumber;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    data['birthdate'] = birthdate;
    data['emiratesCity'] = emiratesCity;
    data['area'] = area;
    if (residentailAddress != null) {
      data['residentailAddress'] = residentailAddress!.toJson();
    }
    if (workAddress != null) {
      data['workAddress'] = workAddress!.toJson();
    }
    data['isAdmin'] = isAdmin;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class ResidentailAddress {
  String? sId;
  String? street;
  String? name;
  int? number;
  String? landMark;
  String? groupType;
  String? contactPerson;
  int? personsNumber;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ResidentailAddress(
      {sId,
      street,
      name,
      number,
      landMark,
      groupType,
      contactPerson,
      personsNumber,
      createdAt,
      updatedAt,
      iV});

  ResidentailAddress.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    street = json['street'];
    name = json['name'];
    number = json['number'];
    landMark = json['landMark'];
    groupType = json['groupType'];
    contactPerson = json['contactPerson'];
    personsNumber = json['personsNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['street'] = street;
    data['name'] = name;
    data['number'] = number;
    data['landMark'] = landMark;
    data['groupType'] = groupType;
    data['contactPerson'] = contactPerson;
    data['personsNumber'] = personsNumber;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class WorkAddress {
  String? sId;
  String? workPlaceName;
  int? workPlaceNameNumber;
  String? contactPerson;
  int? staffNumbers;
  String? createdAt;
  String? updatedAt;
  int? iV;

  WorkAddress(
      {sId,
      workPlaceName,
      workPlaceNameNumber,
      contactPerson,
      staffNumbers,
      createdAt,
      updatedAt,
      iV});

  WorkAddress.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    workPlaceName = json['workPlaceName'];
    workPlaceNameNumber = json['workPlaceNameNumber'];
    contactPerson = json['contactPerson'];
    staffNumbers = json['staffNumbers'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['workPlaceName'] = workPlaceName;
    data['workPlaceNameNumber'] = workPlaceNameNumber;
    data['contactPerson'] = contactPerson;
    data['staffNumbers'] = staffNumbers;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
