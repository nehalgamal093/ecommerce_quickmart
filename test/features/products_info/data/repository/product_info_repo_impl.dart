import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/caching/cache_helper.dart';
import 'package:ecommerce_shop/features/product_info/data/data_source/remote_data_source/product_info_remote_data_source_impl.dart';
import 'package:ecommerce_shop/features/product_info/data/model/product_details_model.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review_request_model.dart';
import 'package:ecommerce_shop/features/product_info/data/repository/product_info_repo_impl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../fixtures/review_fixture.dart';
import '../../../../fixtures/review_response_fixture.dart';

ProductDetailsModel productDetailsModel = ProductDetailsModel(
    message: "success",
    result: Result(
      id: "67d75ac5d7c6ee4f73f543ba",
      title: "HP Envy 16 Touch - 13th i7-13700H",
      slug: "hp-envy-16-touch-13th-i7-13700h",
      price: 8289900,
      priceAfterDiscount: 8000000,
      ratingAvg: 4,
      ratingCount: 0,
      description: "Special Design: You deserve to live in the Utmost Comfort",
      quantity: 10,
      sold: 4,
      images: [
        Images(attachmentFile: "image_url_1"),
      ],
      category: "67d7248604bcc6a34fc4de86",
      subCategory: "67d7538f55679798bbbae04f",
      brand: "65154e49e76b1683b590febc",
      createdAt: "2025-03-16T23:12:05.551Z",
      updatedAt: "2025-03-16T23:12:05.551Z",
      myReviews: [],
    ));

class MockProductInfoRemoteDs extends Mock
    implements ProductInfoRemoteDataSourceImpl {}

void main() async{
  TestWidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  late ProductInfoRepoImpl productInfoRepoImpl;
  late MockProductInfoRemoteDs mockProductInfoRemoteDs;
  setUp(() {
    mockProductInfoRemoteDs = MockProductInfoRemoteDs();
    productInfoRepoImpl = ProductInfoRepoImpl(mockProductInfoRemoteDs);
  });
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({'token': 'fake_token'});
    await CacheHelper.init();
  });
  group("Should check product info repo", () {
    test("Should return product details", () async {
      when(() => mockProductInfoRemoteDs.getProductInfo(any()))
          .thenAnswer((_) async => productDetailsModel);
      final result = await productInfoRepoImpl.getProduct("");
      expect(result, isA<Right>());
    });

    test("Should return reviews success", () async {
      when(() => mockProductInfoRemoteDs.getReviews(any()))
          .thenAnswer((_) async => reviewFixture);
      final result = await productInfoRepoImpl.getReviews("");
      expect(result, isA<Right>());
    });
    test("Should write a review success", () async {
      final token = CacheHelper.getToken();
      expect(token, equals('fake_token'));
      when(() => mockProductInfoRemoteDs.writeReview(
            request: any(named: 'request'),
          )).thenAnswer((_) async => reviewResponseFixture);
      final result = await productInfoRepoImpl.writeReview(
        request: ReviewRequestModel(
            comment: "Nice", product: "67d75ac5d7c6ee4f73f543ba", ratings: 2),
      );
      expect(result, isA<Right>());
    });
  });
}
