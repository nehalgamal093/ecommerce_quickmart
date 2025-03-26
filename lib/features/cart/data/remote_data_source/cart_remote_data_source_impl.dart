import 'package:dio/dio.dart';
import 'package:ecommerce_shop/core/network/api_manager/api_manager.dart';
import 'package:ecommerce_shop/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_shop/features/cart/data/models/delete_cart_response.dart';
import 'package:ecommerce_shop/features/cart/data/remote_data_source/cart_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/caching/cache_helper.dart';
import '../../../../core/resources/endpoints.dart';
import '../../../auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  APIManager apiManager;
  CartRemoteDataSourceImpl(this.apiManager);

  @override
  Future<CartModel> getCart() async {
    var response = await apiManager
        .getRequest(EndPoints.cart, headers: {"token": CacheHelper.getToken()});
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return CartModel.fromJson(response.data);
      } else {
        String errorMessage = "Cart failed";
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
  Future<DeleteCartResponse> deleteCart(String id) async{
    var response = await apiManager.deleteRequest(
        '${EndPoints.cart}/$id',
        headers: {"token": CacheHelper.getToken()},
       );
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return DeleteCartResponse.fromJson(response.data);
      } else {
        String errorMessage = "Delete from cart failed";
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
