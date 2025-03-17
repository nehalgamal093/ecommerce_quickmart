import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/categories/data/models/categories.dart';
import 'package:ecommerce_shop/features/sub_categories/domain/repository/sub_categories_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubCategoriesUseCase {
  SubCategoriesRepo subCategoriesRepo;
  SubCategoriesUseCase(this.subCategoriesRepo);

  Future<Either<AppFailures, Categories>> call(String categoryId) =>
      subCategoriesRepo.getSubCategories(categoryId);
}
