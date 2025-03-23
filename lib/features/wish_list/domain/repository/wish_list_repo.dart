import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/wish_list/data/models/wishlist_model.dart';

abstract class WishlistRepo{
  Future<Either<AppFailures,WishlistModel>> getWishlist();
}