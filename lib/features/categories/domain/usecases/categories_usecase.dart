import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/categories/data/models/categories.dart';
import 'package:ecommerce_shop/features/categories/domain/repository/categories_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesUseCase {
  CategoriesRepo categoriesRepo;
  CategoriesUseCase(this.categoriesRepo);

  Future<Either<AppFailures, Categories>> call() =>
      categoriesRepo.getCategories();
}
