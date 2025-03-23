import 'package:ecommerce_shop/features/wish_list/data/models/wishlist_model.dart';

abstract class WishListRemoteDataSource{
  Future<WishlistModel> getWishList();
}