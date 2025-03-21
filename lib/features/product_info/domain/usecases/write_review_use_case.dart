import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review_request_model.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failures/failures.dart';
import '../repository/product_info_repo.dart';

@injectable
class WriteReviewUseCase {
  ProductInfoRepo productInfoRepo;
  WriteReviewUseCase(this.productInfoRepo);

  Future<Either<AppFailures, ReviewResponse>> call(
          {ReviewRequestModel? request}) =>
      productInfoRepo.writeReview(request: request);
}
