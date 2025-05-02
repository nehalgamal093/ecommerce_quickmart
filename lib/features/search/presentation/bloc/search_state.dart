part of 'search_bloc.dart';

enum SearchRequestState { initial, loading, success, error }

class SearchState {
  SearchRequestState? searchRequestState;
  List<Result>? products;
  AppFailures? failures;

  SearchState({this.searchRequestState, this.products, this.failures});

  SearchState copyWith(
      {SearchRequestState? searchRequestState,
      List<Result>? products,
      AppFailures? failures}) {
    return SearchState(
      searchRequestState: searchRequestState ?? this.searchRequestState,
      products: products ?? this.products,
      failures: failures ?? this.failures,
    );
  }
}

final class SearchInitial extends SearchState {
  SearchInitial()
      : super(
          searchRequestState: SearchRequestState.initial,
        );
}
