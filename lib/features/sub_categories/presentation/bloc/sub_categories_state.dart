part of 'sub_categories_bloc.dart';

enum SubCatRequestState { initial, loading, success, error }

class SubCategoriesState {
  SubCatRequestState? subCatRequestState;
  Categories? categories;
  AppFailures? failures;

  SubCategoriesState({this.subCatRequestState, this.categories, this.failures});

  SubCategoriesState copyWith(
      {SubCatRequestState? subCatRequestState,
      Categories? categories,
      AppFailures? failures}) {
    return SubCategoriesState(
        subCatRequestState: subCatRequestState ?? this.subCatRequestState,
        categories: categories ?? this.categories,
        failures: failures ?? this.failures);
  }
}

final class SubCategoriesInitial extends SubCategoriesState {
  SubCategoriesInitial()
      : super(
          subCatRequestState: SubCatRequestState.initial,
        );
}
