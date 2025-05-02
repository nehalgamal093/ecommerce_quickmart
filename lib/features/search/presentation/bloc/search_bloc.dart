import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/features/search/domain/usecases/search_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/logic/debounce/debounce.dart';
import '../../../../core/logic/failures/failures.dart';
import '../../../products/data/models/products.dart';

part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchUseCase searchUseCase;
  String keyword = "";
  SearchBloc(this.searchUseCase) : super(SearchInitial()) {
    Debounce debounce = Debounce(delay: const Duration(milliseconds: 500));
    on<SearchTextEvent>((event, emit) async {
      keyword = event.keyword;
      debounce.call(() {
        add(SearchProductsEvent());
      });
    });
    on<SearchProductsEvent>((event, emit) async {
      emit(
        state.copyWith(searchRequestState: SearchRequestState.loading),
      );
      var result = await searchUseCase.call(keyword);
      result.fold((error) {
        emit(
          state.copyWith(
              searchRequestState: SearchRequestState.error, failures: error),
        );
      }, (model) {
        List<Result> list = [];
        if (keyword.isNotEmpty && keyword != null) {
          list.addAll(model.result!);
        } else {
          list.clear();
        }
        emit(
          state.copyWith(
              searchRequestState: SearchRequestState.success, products: list),
        );
      });
    });
  }
}
