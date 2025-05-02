import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/features/sub_categories/domain/usecases/sub_categories_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/logic/failures/failures.dart';
import '../../../categories/data/models/categories.dart';

part 'sub_categories_event.dart';
part 'sub_categories_state.dart';

@injectable
class SubCategoriesBloc extends Bloc<SubCategoriesEvent, SubCategoriesState> {
  SubCategoriesUseCase subCategoriesUseCase;
  SubCategoriesBloc(this.subCategoriesUseCase) : super(SubCategoriesInitial()) {
    on<GetSubCategoriesEvent>((event, emit) async {
      emit(
        state.copyWith(subCatRequestState: SubCatRequestState.loading),
      );
      var result = await subCategoriesUseCase.call(event.categoryId);
      result.fold((error) {
        emit(
          state.copyWith(
              subCatRequestState: SubCatRequestState.error, failures: error),
        );
      }, (model) {
        emit(
          state.copyWith(
              subCatRequestState: SubCatRequestState.success,
              categories: model),
        );
      });
    });
  }
}
