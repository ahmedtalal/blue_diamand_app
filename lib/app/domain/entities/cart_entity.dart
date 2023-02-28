import 'package:drinking_app/app/domain/entities/user_entity.dart';

class CartEntity {
  int? cartId;
  UserEntity? userEntity;
  String? cartDate;
  double? cartTotalPrice;

  CartEntity({
    this.cartId,
    this.userEntity,
    this.cartTotalPrice,
    this.cartDate,
  });
}
