abstract class IProductRepository{
  Future<dynamic> createProduct(var productModel);
  Future<dynamic> getAllProducts();
  Future<dynamic> getSpecialProduct(var index);
}