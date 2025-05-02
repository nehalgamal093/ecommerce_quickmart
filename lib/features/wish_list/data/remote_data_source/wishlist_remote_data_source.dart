import 'package:ecommerce_shop/features/wish_list/data/models/wishlist_model.dart';

import '../models/add_wish_list_response.dart';
import '../models/delete_wishlist_response.dart';

abstract class WishListRemoteDataSource {
  Future<WishlistModel> getWishList();
  Future<AddWishListResponse> addToWishList(String productId);
  Future<DeleteWishlistResponse> deleteWishList(String productId);
}
