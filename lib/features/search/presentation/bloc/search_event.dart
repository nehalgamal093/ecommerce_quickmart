part of 'search_bloc.dart';

abstract class SearchEvent {}

class SearchProductsEvent extends SearchEvent {}

class SearchTextEvent extends SearchEvent {
  final String keyword;
  SearchTextEvent(this.keyword);
}
