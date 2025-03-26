import 'package:ecommerce_shop/features/cart/data/models/cart_model.dart';

import '../models/delete_cart_response.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart();
  Future<DeleteCartResponse> deleteCart(String id);
}
