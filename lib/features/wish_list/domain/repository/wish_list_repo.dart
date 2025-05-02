import 'package:dartz/dartz.dart';
import '../../../../core/logic/failures/failures.dart';
import 'package:ecommerce_shop/features/wish_list/data/models/wishlist_model.dart';

import '../../data/models/add_wish_list_response.dart';
import '../../data/models/delete_wishlist_response.dart';

abstract class WishlistRepo {
  Future<Either<AppFailures, WishlistModel>> getWishlist();
  Future<Either<AppFailures, AddWishListResponse>> addToWishlist(
      String productId);
  Future<Either<AppFailures, DeleteWishlistResponse>> deleteFromWishlist(
      String productId);
}
