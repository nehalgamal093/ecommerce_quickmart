import 'package:ecommerce_shop/features/products/data/models/add_wish_list_response.dart';

import '../../models/products.dart';

abstract class ProductsRemoteDataSource {
  Future<Products> getProducts(String subCategoryId);
  Future<AddWishListResponse> addToWishList(String productId);
}
