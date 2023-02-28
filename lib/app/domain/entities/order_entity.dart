import 'package:drinking_app/app/domain/entities/user_entity.dart';

class OrderEntity {
  int? orderId;
  UserEntity? userEntity;
  double? orderTotalPrice;
  String? orderDate;
  OrderEntity({
    this.orderId,
    this.userEntity,
    this.orderDate,
    this.orderTotalPrice,
  });
}
