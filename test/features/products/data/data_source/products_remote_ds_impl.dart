import 'package:dio/dio.dart';
import 'package:ecommerce_shop/core/network/api_manager/api_manager.dart';
import 'package:ecommerce_shop/features/products/data/data_source/remote_data_source/products_remote_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ecommerce_shop/features/products/data/models/products.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../fixtures/products_response.dart';

class MockAPIManager extends Mock implements APIManager{}
void main()async{
  TestWidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  late ProductsRemoteDataSourceImpl productsDataSource;
  late MockAPIManager mockAPIManager;
  setUp((){
    mockAPIManager = MockAPIManager();
    productsDataSource = ProductsRemoteDataSourceImpl(mockAPIManager);
  });

  test('Should return list of products Success',()async{
    final mockResponse = Response(requestOptions: RequestOptions(path: ''),data: productJsonFixture(),statusCode: 200);
    when(()=>mockAPIManager.getRequest(any())).thenAnswer((_)async=>mockResponse);
      final result = await productsDataSource.getProducts("67d866f11b503c79935b0642");
      expect(result,isA<Products>());
  });
}