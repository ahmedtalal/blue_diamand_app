import 'package:drinking_app/app/domain/entities/cart_entity.dart';
import 'package:drinking_app/app/domain/entities/product_entity.dart';

class CartProductsEntity {
  int? cartPorductId;
  ProductEntity? productEntity;
  CartEntity? cartEntity;
  double? cartProductQuantity;
  CartProductsEntity({
    this.cartPorductId,
    this.cartEntity,
    this.productEntity,
    this.cartProductQuantity,
  });
}
