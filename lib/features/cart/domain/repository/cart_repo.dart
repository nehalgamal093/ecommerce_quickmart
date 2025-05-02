import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/cart/data/models/apply_coupon_reponse.dart';

import '../../../../core/logic/failures/failures.dart';
import '../../data/models/add_cart_response.dart';
import '../../data/models/cart_model.dart';
import '../../data/models/delete_cart_response.dart';

abstract class CartRepo {
  Future<Either<AppFailures, CartModel>> getCart();
  Future<Either<AppFailures, DeleteCartResponse>> deleteCart(String id);
  Future<Either<AppFailures, ApplyCouponReponse>> applyCoupon(String code);
  Future<Either<AppFailures, AddCartResponse>> addToCart(String productId);
}
