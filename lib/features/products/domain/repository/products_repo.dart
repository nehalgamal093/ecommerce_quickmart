import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/products/data/models/add_wish_list_response.dart';
import 'package:ecommerce_shop/features/products/data/models/delete_wishlist_response.dart';
import 'package:ecommerce_shop/features/products/data/models/products.dart';

import '../../../wish_list/data/models/wishlist_model.dart';

abstract class ProductsRepo {
  Future<Either<AppFailures, Products>> getProducts(String subCategoryId);
  Future<Either<AppFailures, AddWishListResponse>> addToWishlist(String productId);
  Future<Either<AppFailures,WishlistModel>> getWishlist();
  Future<Either<AppFailures, DeleteWishlistResponse>> deleteFromWishlist(String productId);
}
