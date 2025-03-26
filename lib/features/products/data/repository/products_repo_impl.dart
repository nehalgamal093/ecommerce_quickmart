import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/products/data/data_source/remote_data_source/products_remote_data_source.dart';
import 'package:ecommerce_shop/features/products/data/models/add_wish_list_response.dart';
import 'package:ecommerce_shop/features/products/data/models/delete_wishlist_response.dart';
import 'package:ecommerce_shop/features/products/data/models/products.dart';
import 'package:ecommerce_shop/features/products/domain/repository/products_repo.dart';
import 'package:ecommerce_shop/features/wish_list/data/models/wishlist_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/remote_failures.dart';
import '../../../auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo {
  ProductsRemoteDataSource productsRemoteDataSource;
  ProductsRepoImpl(this.productsRemoteDataSource);

  @override
  Future<Either<AppFailures, Products>> getProducts(
      String subCategoryId) async {
    try {
      var result = await productsRemoteDataSource.getProducts(subCategoryId);
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
      var result = await productsRemoteDataSource.addToWishList(productId);

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
  Future<Either<AppFailures, WishlistModel>> getWishlist() async {
    try {
      var result = await productsRemoteDataSource.getWishList();
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
      var result = await productsRemoteDataSource.deleteWishList(productId);

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
