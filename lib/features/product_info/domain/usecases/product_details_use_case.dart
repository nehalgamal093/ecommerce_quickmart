import 'package:dartz/dartz.dart';
import '../../../../core/logic/failures/failures.dart';
import 'package:ecommerce_shop/features/product_info/data/model/product_details_model.dart';
import 'package:ecommerce_shop/features/product_info/domain/repository/product_info_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsUseCase {
  ProductInfoRepo productInfoRepo;
  ProductDetailsUseCase(this.productInfoRepo);

  Future<Either<AppFailures, ProductDetailsModel>> call(String id) =>
      productInfoRepo.getProduct(id);
}
