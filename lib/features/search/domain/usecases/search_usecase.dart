import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/search/domain/repository/search_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/logic/failures/failures.dart';
import '../../../products/data/models/products.dart';

@injectable
class SearchUseCase {
  SearchRepo searchRepo;
  SearchUseCase(this.searchRepo);

  Future<Either<AppFailures, Products>> call(String keyword) =>
      searchRepo.searchProducts(keyword);
}
