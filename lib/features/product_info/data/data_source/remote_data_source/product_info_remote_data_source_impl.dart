import 'package:dio/dio.dart';
import 'package:ecommerce_shop/core/caching/cache_helper.dart';
import 'package:ecommerce_shop/core/network/api_manager/api_manager.dart';
import 'package:ecommerce_shop/features/product_info/data/data_source/remote_data_source/product_info_remote_data_source.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review_request_model.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/resources/endpoints.dart';
import '../../../../auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';

@Injectable(as: ProductInfoRemoteDataSource)
class ProductInfoRemoteDataSourceImpl implements ProductInfoRemoteDataSource {
  APIManager apiManager;
  ProductInfoRemoteDataSourceImpl(this.apiManager);

  @override
  Future<Review> getReviews(String id) async {
    var response = await apiManager.getRequest(EndPoints.reviews(id));
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Review.fromJson(response.data);
      } else {
        String errorMessage = "Reviews failed";
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['errors'][0]['msg'] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }

  @override
  Future<ReviewResponse> writeReview({ReviewRequestModel? request}) async {
    var response = await apiManager.postRequest(
        EndPoints.writeReview, request!.toJson(),
        headers: {"token": CacheHelper.getToken()});
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ReviewResponse.fromJson(response.data);
      } else {
        String errorMessage = "Writing Review failed";
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['errors'][0]['msg'] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }
}
