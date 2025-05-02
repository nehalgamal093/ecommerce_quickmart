import 'package:dartz/dartz.dart';
import '../../../../core/logic/failures/failures.dart';
import 'package:ecommerce_shop/features/products/data/models/products.dart';

abstract class ProductsRepo {
  Future<Either<AppFailures, Products>> getProducts(String subCategoryId);
}
