import 'package:dio/dio.dart';
import 'package:ecommerce_shop/core/network/api_manager/api_manager.dart';
import 'package:ecommerce_shop/features/categories/data/models/categories.dart';
import 'package:ecommerce_shop/features/sub_categories/data/data_source/remote_data_source/sub_categories_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/resources/constants/endpoints.dart';
import '../../../../auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';

@Injectable(as: SubCategoriesRemoteDataSource)
class SubCategoriesRemoteDataSourceImpl
    implements SubCategoriesRemoteDataSource {
  APIManager apiManager;
  SubCategoriesRemoteDataSourceImpl(this.apiManager);

  @override
  Future<Categories> getSubCategories(String categoryId) async {
    var response =
        await apiManager.getRequest(EndPoints.subCategories(categoryId));
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
