import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/cart/data/models/apply_coupon_reponse.dart';
import 'package:ecommerce_shop/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_shop/features/cart/data/models/delete_cart_response.dart';
import 'package:ecommerce_shop/features/cart/domain/repository/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/remote_failures.dart';
import '../../../auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';
import '../remote_data_source/cart_remote_data_source.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  CartRemoteDataSource cartRemoteDataSource;
  CartRepoImpl(this.cartRemoteDataSource);

  @override
  Future<Either<AppFailures, CartModel>> getCart() async {
    try {
      var result = await cartRemoteDataSource.getCart();
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(
        RemoteFailures("An unexpected error occurred"),
      );
    }
  }

  @override
  Future<Either<AppFailures, DeleteCartResponse>> deleteCart(String id) async {
    try {
      var result = await cartRemoteDataSource.deleteCart(id);

      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(
        RemoteFailures("An unexpected error occurred"),
      );
    }
  }

  @override
  Future<Either<AppFailures, ApplyCouponReponse>> applyCoupon(
      String code) async {
    try {
      var result = await cartRemoteDataSource.applyCoupon(code);
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(
        RemoteFailures("An unexpected error occurred"),
      );
    }
  }
}
