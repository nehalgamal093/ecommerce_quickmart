import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/categories/data/models/categories.dart';
import 'package:ecommerce_shop/features/categories/domain/usecases/categories_usecase.dart';
import 'package:injectable/injectable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

@injectable
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesUseCase categoriesUseCase;
  CategoriesBloc(this.categoriesUseCase) : super(CategoriesInitial()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(
        state.copyWith(categoriesRequestState: CategoriesRequestState.loading),
      );
      var result = await categoriesUseCase.call();
      result.fold((error) {
        emit(
          state.copyWith(
              categoriesRequestState: CategoriesRequestState.error,
              failures: error),
        );
      }, (model) {
        emit(
          state.copyWith(
              categoriesRequestState: CategoriesRequestState.success,
              categories: model),
        );
      });
    });
  }
}
