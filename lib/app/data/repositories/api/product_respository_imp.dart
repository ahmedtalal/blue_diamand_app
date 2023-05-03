import 'package:drinking_app/app/domain/repositories/i_product_repository.dart';

import '../../services/apis/product_api_services.dart';

class ProductRepositoryImp implements IProductRepository{
  static ProductRepositoryImp? _productRepositoryImp;
  ProductRepositoryImp._internal();
  static ProductRepositoryImp instance(){
    if(_productRepositoryImp == null){
      return _productRepositoryImp = ProductRepositoryImp._internal();
    }
    return _productRepositoryImp!;
  }
  @override
  Future<Map<String,dynamic>> createProduct(productModel) async{
   return await ProductAPiServices.instance().createProductSer(productModel);
  }

  @override
  Future getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future getSpecialProduct(index) {
    // TODO: implement getSpecialProduct
    throw UnimplementedError();
  }

}