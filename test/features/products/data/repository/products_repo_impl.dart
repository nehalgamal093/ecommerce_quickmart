import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/logic/failures/failures.dart';
import 'package:ecommerce_shop/features/products/data/data_source/remote_data_source/products_remote_data_source_impl.dart';
import 'package:ecommerce_shop/features/products/data/models/products.dart';
import 'package:ecommerce_shop/features/products/data/repository/products_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductsRemoteDs extends Mock
    implements ProductsRemoteDataSourceImpl {}

Products products =
    Products(pages: 1, message: "Success", page: 1, pagePerCategory: 1);

void main() {
  late ProductsRepoImpl productsRepoImpl;
  late MockProductsRemoteDs mockProductsRemoteDs;

  setUp(() {
    mockProductsRemoteDs = MockProductsRemoteDs();
    productsRepoImpl = ProductsRepoImpl(mockProductsRemoteDs);
  });

  test('Should check products repository Success', () async {
    when(() => mockProductsRemoteDs.getProducts(any()))
        .thenAnswer((_) async => products);
    final result = await productsRepoImpl.getProducts("");
    expect(result, isA<Right>());
  });
}
