import 'package:ecommerce_shop/features/product_info/data/model/add_cart_response.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review_request_model.dart';
import '../../model/product_details_model.dart';
import '../../model/review_response.dart';

abstract class ProductInfoRemoteDataSource{
  Future<Review> getReviews(String id);
  Future<ReviewResponse> writeReview({ReviewRequestModel? request});
  Future<ProductDetailsModel> getProductInfo(String id);
  Future<AddCartResponse> addToCart(String productId);
}