import 'package:ecommerce_shop/features/products/data/models/add_wish_list_response.dart';
import 'package:ecommerce_shop/features/products/data/models/delete_wishlist_response.dart';

import '../../../../wish_list/data/models/wishlist_model.dart';
import '../../models/products.dart';

abstract class ProductsRemoteDataSource {
  Future<Products> getProducts(String subCategoryId);
  Future<AddWishListResponse> addToWishList(String productId);
  Future<WishlistModel> getWishList();
  Future<DeleteWishlistResponse> deleteWishList(String productId);
}
