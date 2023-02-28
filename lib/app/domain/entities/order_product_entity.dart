import 'package:drinking_app/app/domain/entities/order_entity.dart';
import 'package:drinking_app/app/domain/entities/product_entity.dart';

class OrderProductEntity {
  int? orderProductId;
  OrderEntity? orderEntity;
  double? orderProductQuantity;
  ProductEntity? productEntity;
  OrderProductEntity(
      {this.orderProductId,
      this.orderEntity,
      this.productEntity,
      this.orderProductQuantity});
}
