import 'package:dio/dio.dart';
import 'package:ecommerce_shop/features/products/data/data_source/remote_data_source/products_remote_data_source.dart';
import 'package:ecommerce_shop/features/products/data/models/add_wish_list_response.dart';
import 'package:ecommerce_shop/features/products/data/models/delete_wishlist_response.dart';
import 'package:ecommerce_shop/features/products/data/models/products.dart';
import 'package:ecommerce_shop/features/wish_list/data/models/wishlist_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/caching/cache_helper.dart';
import '../../../../../core/network/api_manager/api_manager.dart';
import '../../../../../core/resources/endpoints.dart';
import '../../../../auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';

@Injectable(as: ProductsRemoteDataSource)
class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  APIManager apiManager;
  ProductsRemoteDataSourceImpl(this.apiManager);

  @override
  Future<Products> getProducts(String subCategoryId) async {
    var response =
        await apiManager.getRequest(EndPoints.products(subCategoryId));
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Products.fromJson(response.data);
      } else {
        String errorMessage = "Products failed";
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
  Future<AddWishListResponse> addToWishList(String productId) async {
    var response = await apiManager.patchRequest(
        EndPoints.wishList,
        headers: {"token": CacheHelper.getToken()},
        {"product": productId});
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AddWishListResponse.fromJson(response.data);
      } else {
        String errorMessage = "Add to wishlist failed";
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
  Future<WishlistModel> getWishList() async{
    var response = await apiManager.getRequest(EndPoints.wishList,
        headers: {"token": CacheHelper.getToken()});
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return WishlistModel.fromJson(response.data);
      } else {
        String errorMessage = "Wishlist failed";
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
  Future<DeleteWishlistResponse> deleteWishList(String productId) async{
    var response = await apiManager.deleteRequest(
        EndPoints.wishList,data: {"product": productId},
        headers: {"token": CacheHelper.getToken()},
        );
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return DeleteWishlistResponse.fromJson(response.data);
      } else {
        String errorMessage = "Delete from wishlist failed";
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
