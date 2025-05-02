import 'package:dio/dio.dart';
import 'package:ecommerce_shop/core/network/api_manager/api_manager.dart';
import 'package:ecommerce_shop/core/resources/constants/endpoints.dart';
import 'package:ecommerce_shop/features/products/data/models/products.dart';
import 'package:ecommerce_shop/features/search/data/remote_data_source/search_remote_ds.dart';
import 'package:injectable/injectable.dart';

import '../../../auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';

@Injectable(as: SearchProductRemoteDs)
class SearchProductsRemoteDsImpl implements SearchProductRemoteDs {
  APIManager apiManager;
  SearchProductsRemoteDsImpl(this.apiManager);

  @override
  Future<Products> searchProducts(String keyword) async {
    var response = await apiManager.getRequest(EndPoints.search(keyword));
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Products.fromJson(response.data);
      } else {
        String errorMessage = "Search Products failed";
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
