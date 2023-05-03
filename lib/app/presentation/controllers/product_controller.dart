import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:drinking_app/app/data/models/product_model.dart';
import 'package:drinking_app/app/data/repositories/api/product_respository_imp.dart';
import 'package:drinking_app/app/domain/usecases/product_usecases_prodivder.dart';

class ProductController {
  static ProductController? _productController;
  ProductController._internal();
  static ProductController instance() {
    if (_productController == null) {
      return _productController = ProductController._internal();
    }
    return _productController!;
  }

  onCreateProduct() async {
    final result = await ProductUseCasesProvider.instance()
        .creator<ProductRepositoryImp>(ProductRepositoryImp.instance())
        .createProduct(ProductModel());
    if(result[mapKey] == successMapkey){
      // TODO: implementation here
    }else {
      // TODO:implementation here
    }
  }
}
