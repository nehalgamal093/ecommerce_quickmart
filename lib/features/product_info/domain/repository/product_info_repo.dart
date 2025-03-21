import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review_request_model.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review_response.dart';

abstract class ProductInfoRepo{
  Future<Either<AppFailures,Review>> getReviews(String id);
  Future<Either<AppFailures,ReviewResponse>> writeReview({ReviewRequestModel? request});
}