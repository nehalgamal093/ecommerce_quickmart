import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import '../../data/models/cart_model.dart';
import '../../data/models/delete_cart_response.dart';

abstract class CartRepo{
  Future<Either<AppFailures,CartModel>> getCart();
  Future<Either<AppFailures,DeleteCartResponse>> deleteCart(String id);
}