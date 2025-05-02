import 'package:ecommerce_shop/features/products/data/models/products.dart';

abstract class SearchProductRemoteDs {
  Future<Products> searchProducts(String keyword);
}
