import 'package:drinking_app/app/domain/repositories/i_product_repository.dart';

class ProductUseCasesProvider {
  static ProductUseCasesProvider? _productUseCasesProvider;
  ProductUseCasesProvider._internal();
  static ProductUseCasesProvider instance() {
    if (_productUseCasesProvider == null) {
      return _productUseCasesProvider = ProductUseCasesProvider._internal();
    }
    return _productUseCasesProvider!;
  }

  IProductRepository creator<IProductRepository>(IProductRepository iProductRepository) =>
      iProductRepository;
}
