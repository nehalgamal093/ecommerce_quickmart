import 'package:dio/dio.dart';
import 'package:ecommerce_shop/core/caching/cache_helper.dart';
import 'package:ecommerce_shop/features/product_info/data/data_source/remote_data_source/product_info_remote_data_source_impl.dart';
import 'package:ecommerce_shop/features/product_info/data/model/product_details_model.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review_request_model.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../fixtures/products_response.dart';
import '../../../products/data/data_source/products_remote_ds_impl.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  late ProductInfoRemoteDataSourceImpl productInfoRemoteDataSourceImpl;
  late MockAPIManager mockAPIManager;
  setUp(() {
    mockAPIManager = MockAPIManager();
    productInfoRemoteDataSourceImpl =
        ProductInfoRemoteDataSourceImpl(mockAPIManager);
  });
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({'token': 'fake_token'});
    await CacheHelper.init();
  });
  group('Product Test', () {
    test('Should return product information Success', () async {
      final mockResponse = Response(
          requestOptions: RequestOptions(path: ''),
          data: productInforJsonFixture(),
          statusCode: 200);
      when(() => mockAPIManager.getRequest(any()))
          .thenAnswer((_) async => mockResponse);
      final result = await productInfoRemoteDataSourceImpl
          .getProductInfo("67d75ac5d7c6ee4f73f543ba");
      expect(result, isA<ProductDetailsModel>());
    });
    test('Should return Reviews Success', () async {
      final mockResponse = Response(
          requestOptions: RequestOptions(path: ''),
          data: reviewsForJsonFixture(),
          statusCode: 200);
      when(() => mockAPIManager.getRequest(any()))
          .thenAnswer((_) async => mockResponse);
      final result = await productInfoRemoteDataSourceImpl
          .getReviews("67d75ac5d7c6ee4f73f543ba");
      expect(result, isA<Review>());
    });
    test('Should return Reviews response success when writing a review',
        () async {
      final token = CacheHelper.getToken();
      expect(token, equals('fake_token'));

      final mockResponse = Response(
          requestOptions: RequestOptions(path: ''),
          data: reviewResponseforJsonFixture(),
          statusCode: 200);
      when(() => mockAPIManager.postRequest(
            any(),
            any(),
            headers: any(named: 'headers'),
          )).thenAnswer((_) async => mockResponse);
      final result = await productInfoRemoteDataSourceImpl.writeReview(
        request: ReviewRequestModel(
            comment: "Nice", product: "67d75ac5d7c6ee4f73f543ba", ratings: 5),
      );
      expect(result, isA<ReviewResponse>());
    });
  });
}
