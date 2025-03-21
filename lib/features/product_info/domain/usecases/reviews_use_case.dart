import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review.dart';
import 'package:ecommerce_shop/features/product_info/domain/repository/product_info_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReviewsUseCase {
  ProductInfoRepo productInfoRepo;
  ReviewsUseCase(this.productInfoRepo);

  Future<Either<AppFailures, Review>> call(String id) =>
      productInfoRepo.getReviews(id);
}
