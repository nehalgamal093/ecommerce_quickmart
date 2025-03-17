part of 'categories_bloc.dart';

enum CategoriesRequestState { initial, loading, success, error }

class CategoriesState {
  CategoriesRequestState? categoriesRequestState;
  Categories? categories;
  AppFailures? failures;

  CategoriesState(
      {this.categoriesRequestState, this.categories, this.failures});

  CategoriesState copyWith(
      {CategoriesRequestState? categoriesRequestState,
      Categories? categories,
      AppFailures? failures}) {
    return CategoriesState(
        categoriesRequestState:
            categoriesRequestState ?? this.categoriesRequestState,
        categories: categories ?? this.categories,
        failures: failures ?? this.failures);
  }
}

final class CategoriesInitial extends CategoriesState {
  CategoriesInitial()
      : super(
          categoriesRequestState: CategoriesRequestState.initial,
        );
}
