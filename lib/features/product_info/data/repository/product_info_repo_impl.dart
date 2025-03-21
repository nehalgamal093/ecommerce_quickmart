import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/product_info/data/data_source/remote_data_source/product_info_remote_data_source.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review_request_model.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review_response.dart';
import 'package:ecommerce_shop/features/product_info/domain/repository/product_info_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failures/remote_failures.dart';
import '../../../auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';

@Injectable(as: ProductInfoRepo)
class ProductInfoRepoImpl implements ProductInfoRepo {
  ProductInfoRemoteDataSource productInfoRemoteDataSource;
  ProductInfoRepoImpl(this.productInfoRemoteDataSource);

  @override
  Future<Either<AppFailures, Review>> getReviews(String id) async {
    try {
      var result = await productInfoRemoteDataSource.getReviews(id);
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
  Future<Either<AppFailures, ReviewResponse>> writeReview(
      {ReviewRequestModel? request}) async {
    try {
      var result =
          await productInfoRemoteDataSource.writeReview(request: request);

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
