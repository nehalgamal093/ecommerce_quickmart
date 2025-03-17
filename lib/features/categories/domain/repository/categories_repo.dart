import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/categories/data/models/categories.dart';

abstract class CategoriesRepo {
  Future<Either<AppFailures, Categories>> getCategories();
}
