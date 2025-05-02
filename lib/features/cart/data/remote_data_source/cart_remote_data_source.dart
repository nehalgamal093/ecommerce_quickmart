import 'package:ecommerce_shop/features/cart/data/models/cart_model.dart';
import '../models/add_cart_response.dart';
import '../models/apply_coupon_reponse.dart';
import '../models/delete_cart_response.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart();
  Future<DeleteCartResponse> deleteCart(String id);
  Future<ApplyCouponReponse> applyCoupon(String code);
  Future<AddCartResponse> addToCart(String productId);
}
