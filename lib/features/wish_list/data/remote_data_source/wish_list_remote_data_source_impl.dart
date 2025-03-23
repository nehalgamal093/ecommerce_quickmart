import 'package:dio/dio.dart';
import 'package:ecommerce_shop/core/caching/cache_helper.dart';
import 'package:ecommerce_shop/core/network/api_manager/api_manager.dart';
import 'package:ecommerce_shop/features/wish_list/data/models/wishlist_model.dart';
import 'package:ecommerce_shop/features/wish_list/data/remote_data_source/wishlist_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/resources/endpoints.dart';
import '../../../auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';

@Injectable(as: WishListRemoteDataSource)
class WishListRemoteDataSourceImpl implements WishListRemoteDataSource {
  APIManager apiManager;
  WishListRemoteDataSourceImpl(this.apiManager);

  @override
  Future<WishlistModel> getWishList() async {
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
}
