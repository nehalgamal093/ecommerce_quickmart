import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/wish_list/data/remote_data_source/wishlist_remote_data_source.dart';
import 'package:ecommerce_shop/features/wish_list/domain/repository/wish_list_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/logic/failures/failures.dart';
import '../../../../core/logic/failures/remote_failures.dart';
import '../../../auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';
import '../models/add_wish_list_response.dart';
import '../models/delete_wishlist_response.dart';
import '../models/wishlist_model.dart';

@Injectable(as: WishlistRepo)
class WishlistRepoImpl implements WishlistRepo {
  WishListRemoteDataSource wishListRemoteDataSource;
  WishlistRepoImpl(this.wishListRemoteDataSource);

  @override
  Future<Either<AppFailures, WishlistModel>> getWishlist() async {
    try {
      var result = await wishListRemoteDataSource.getWishList();
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
  Future<Either<AppFailures, AddWishListResponse>> addToWishlist(
      String productId) async {
    try {
      var result = await wishListRemoteDataSource.addToWishList(productId);

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
  Future<Either<AppFailures, DeleteWishlistResponse>> deleteFromWishlist(
      String productId) async {
    try {
      var result = await wishListRemoteDataSource.deleteWishList(productId);

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
