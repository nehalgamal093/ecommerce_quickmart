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

final List<Result> results = [
  Result(
    id: "1",
    title: "Test Product",
    price: 100,
    priceAfterDiscount: 90,
    ratingAvg: 4.5,
    ratingCount: 10,
    description: "A test product",
    quantity: 50,
    sold: 5,
    images: [
      Images(attachmentFile: "image_url_1"),
    ],
    category: "Electronics",
    subCategory: "Phones",
    brand: "TestBrand",
    createdAt: "2025-01-01T00:00:00Z",
    updatedAt: "2025-01-02T00:00:00Z",
    v: 1,
    myReviews: ["Nice", "Good"],
  )
];
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
