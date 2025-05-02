import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/products/data/models/products.dart';
import 'package:ecommerce_shop/features/search/data/remote_data_source/search_remote_ds.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/logic/failures/failures.dart';
import '../../../../core/logic/failures/remote_failures.dart';
import '../../../auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';
import '../../domain/repository/search_repo.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  SearchProductRemoteDs searchProductRemoteDs;

  SearchRepoImpl(this.searchProductRemoteDs);
  @override
  Future<Either<AppFailures, Products>> searchProducts(String keyword) async {
    try {
      var result = await searchProductRemoteDs.searchProducts(keyword);
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
