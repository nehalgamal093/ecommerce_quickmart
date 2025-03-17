import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/categories/data/models/categories.dart';
import 'package:ecommerce_shop/features/sub_categories/data/data_source/remote_data_source/sub_categories_remote_data_source.dart';
import 'package:ecommerce_shop/features/sub_categories/domain/repository/sub_categories_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/remote_failures.dart';
import '../../../auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';

@Injectable(as: SubCategoriesRepo)
class SubCategoriesRepoImpl implements SubCategoriesRepo {
  SubCategoriesRemoteDataSource subCategoriesRemoteDataSource;
  SubCategoriesRepoImpl(this.subCategoriesRemoteDataSource);

  @override
  Future<Either<AppFailures, Categories>> getSubCategories(
      String categoryId) async {
    try {
      var result =
          await subCategoriesRemoteDataSource.getSubCategories(categoryId);
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
