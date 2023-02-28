class ResidentailAddress {
  String? street;
  int? personsNumber;
  String? name;
  String? landMark;
  String? groupType;
  String? contactPerson;
  int? number;

  ResidentailAddress(
      {this.street,
      this.personsNumber,
      this.name,
      this.landMark,
      this.groupType,
      this.contactPerson,
      this.number});

  factory ResidentailAddress.fromJson(Map<String, dynamic> json) {
    return ResidentailAddress(
      street: json['street'],
      personsNumber: json['personsNumber'],
      name: json['name'],
      landMark: json['landMark'],
      groupType: json['groupType'],
      contactPerson: json['contactPerson'],
      number: json['number'],
    );
  }

  static Map<String, dynamic> toJson(ResidentailAddress residentailAddress) {
    return {
      'street': residentailAddress.street,
      'personsNumber': residentailAddress.personsNumber,
      'name': residentailAddress.name,
      'landMark': residentailAddress.landMark,
      'groupType': residentailAddress.groupType,
      'contactPerson': residentailAddress.contactPerson,
      'number': residentailAddress.number,
    };
  }
}
