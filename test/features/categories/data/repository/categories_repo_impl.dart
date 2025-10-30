import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/categories/data/data_source/remote_data_source/categories_remote_data_source_impl.dart';
import 'package:ecommerce_shop/features/categories/data/models/categories.dart';
import 'package:ecommerce_shop/features/categories/data/repository/categories_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/categories_fixture.dart';

class MockRemoteDsImpl extends Mock implements RemoteDataSourceImpl{

}

void main(){
 late MockRemoteDsImpl mockRemoteDsImpl;
  late CategoriesRepoImpl categoriesRepoImpl;

  setUp((){
    mockRemoteDsImpl = MockRemoteDsImpl();
    categoriesRepoImpl = CategoriesRepoImpl(mockRemoteDsImpl);
  });

  test('Return right if return categories success', ()async{
    when(()=>mockRemoteDsImpl.getCategories()).thenAnswer((_)async=>categories);
    final result = await categoriesRepoImpl.getCategories();
    expect(result, isA<Right>());
  });
}