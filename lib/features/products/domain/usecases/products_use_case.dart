import 'package:dartz/dartz.dart';
import '../../../../core/logic/failures/failures.dart';
import 'package:ecommerce_shop/features/products/data/models/products.dart';
import 'package:ecommerce_shop/features/products/domain/repository/products_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsUseCase {
  ProductsRepo productsRepo;
  ProductsUseCase(this.productsRepo);

  Future<Either<AppFailures, Products>> call(String subCategoryId) =>
      productsRepo.getProducts(subCategoryId);
}
