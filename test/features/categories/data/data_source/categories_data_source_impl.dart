import 'package:dio/dio.dart';
import 'package:ecommerce_shop/core/network/api_manager/api_manager.dart';
import 'package:ecommerce_shop/features/categories/data/data_source/remote_data_source/categories_remote_data_source_impl.dart';
import 'package:ecommerce_shop/features/categories/data/models/categories.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/categories_fixture.dart';

class MockAPIManager extends Mock implements APIManager {}

void main() async{
  TestWidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  late RemoteDataSourceImpl remoteDataSourceImpl;
  late MockAPIManager mockAPIManager;

  setUp(() {
    mockAPIManager = MockAPIManager();
    remoteDataSourceImpl = RemoteDataSourceImpl(mockAPIManager);
  });
  test("return categories success", () async {
    final mockResponse = Response(
        requestOptions: RequestOptions(path: ''),
        data: categoriesForJsonFixture(),
        statusCode: 200);
    when(() => mockAPIManager.getRequest(any()))
        .thenAnswer((_) async => mockResponse);
    final result = await remoteDataSourceImpl.getCategories();
    expect(result, isA<Categories>());
  });
}
