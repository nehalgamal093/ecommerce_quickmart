import 'package:dio/dio.dart';
import 'package:ecommerce_shop/core/network/api_manager/api_manager.dart';
import 'package:ecommerce_shop/core/resources/endpoints.dart';
import 'package:ecommerce_shop/features/categories/data/data_source/remote_data_source/categories_remote_datasource.dart';
import 'package:ecommerce_shop/features/categories/data/models/categories.dart';
import 'package:injectable/injectable.dart';

import '../../../../auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';

@Injectable(as: CategoriesRemoteDataSource)
class RemoteDataSourceImpl implements CategoriesRemoteDataSource {
  APIManager apiManager;
  RemoteDataSourceImpl(this.apiManager);
  @override
  Future<Categories> getCategories() async {
    var response = await apiManager.getRequest(EndPoints.categories);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Categories.fromJson(response.data);
      } else {
        String errorMessage = "Categories failed";
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
