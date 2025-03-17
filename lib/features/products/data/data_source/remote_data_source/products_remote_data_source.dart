import '../../models/products.dart';

abstract class ProductsRemoteDataSource {
  Future<Products> getProducts(String subCategoryId);
}
