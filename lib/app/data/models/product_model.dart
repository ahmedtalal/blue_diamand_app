import 'package:drinking_app/app/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity{
ProductModel({super.discount,
  super.currency,
  super.id,
  super.name,
  super.quantity,
  super.price,
  super.description,
  super.litrs,
  super.addedBy,
  super.image,
  super.updatedAt,
  super.createdAt});

ProductModel.fromJson(Map<String, dynamic> json) {
    discount = json['discount'];
    currency = json['currency'];
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    description = json['description'];
    litrs = json['litrs'];
    addedBy = json['addedBy'];
    image = json['image'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

 static Map<String, dynamic> toJson(ProductEntity model) {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['discount'] = model.discount;
    data['currency'] = model.currency;
    data['id'] = model.id;
    data['name'] = model.name;
    data['quantity'] = model.quantity;
    data['price'] = model.price;
    data['description'] = model.description;
    data['litrs'] = model.litrs;
    data['addedBy'] = model.addedBy;
    data['image'] = model.image;
    data['updatedAt'] = model.updatedAt;
    data['createdAt'] = model.createdAt;
    return data;
  }
}