import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/features/products/domain/usecases/products_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failures.dart';
import '../../data/models/products.dart';

part 'products_event.dart';
part 'products_state.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsUseCase productsUseCase;
  ProductsBloc(this.productsUseCase) : super(ProductsInitial()) {
    on<GetProductsEvent>((event, emit) async {
      emit(
        state.copyWith(productsRequestState: ProductsRequestState.loading),
      );
      var result = await productsUseCase.call(event.subCategoryId);
      result.fold((error) {
        emit(
          state.copyWith(
              productsRequestState: ProductsRequestState.error,
              failures: error),
        );
      }, (model) {
        emit(
          state.copyWith(
              productsRequestState: ProductsRequestState.success,
              products: model),
        );
      });
    });
  }
}
