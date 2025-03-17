import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/categories/data/data_source/remote_data_source/categories_remote_datasource.dart';
import 'package:ecommerce_shop/features/categories/data/models/categories.dart';
import 'package:ecommerce_shop/features/categories/domain/repository/categories_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/remote_failures.dart';
import '../../../auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  CategoriesRemoteDataSource categoriesRemoteDataSource;
  CategoriesRepoImpl(this.categoriesRemoteDataSource);

  @override
  Future<Either<AppFailures, Categories>> getCategories() async {
    try {
      var result = await categoriesRemoteDataSource.getCategories();
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
