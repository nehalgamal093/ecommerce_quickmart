import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/products/data/data_source/remote_data_source/products_remote_data_source.dart';
import 'package:ecommerce_shop/features/products/data/models/products.dart';
import 'package:ecommerce_shop/features/products/domain/repository/products_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/logic/failures/failures.dart';
import '../../../../core/logic/failures/remote_failures.dart';
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
}
