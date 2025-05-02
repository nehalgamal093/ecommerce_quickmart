import 'package:dartz/dartz.dart';
import '../../../../core/logic/failures/failures.dart';
import 'package:ecommerce_shop/features/categories/data/models/categories.dart';

abstract class CategoriesRepo {
  Future<Either<AppFailures, Categories>> getCategories();
}
