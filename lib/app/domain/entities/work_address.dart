class WorkAddress {
  String? workPlaceName;
  int? workPlaceNameNumber;
  int? staffNumbers;
  String? contactPerson;

  WorkAddress(
      {this.workPlaceName,
      this.workPlaceNameNumber,
      this.staffNumbers,
      this.contactPerson});

  factory WorkAddress.fromJson(Map<String, dynamic> json) {
    return WorkAddress(
      workPlaceName: json['workPlaceName'],
      workPlaceNameNumber: json['workPlaceNameNumber'],
      staffNumbers: json['staffNumbers'],
      contactPerson: json['contactPerson'],
    );
  }

  static Map<String, dynamic> toJson(WorkAddress workAddress) {
    return {
      'workPlaceName': workAddress.workPlaceName,
      'workPlaceNameNumber': workAddress.workPlaceNameNumber,
      'staffNumbers': workAddress.staffNumbers,
      'contactPerson': workAddress.contactPerson,
    };
  }
}
