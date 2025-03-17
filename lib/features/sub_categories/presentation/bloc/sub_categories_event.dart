part of 'sub_categories_bloc.dart';


abstract class SubCategoriesEvent {}

class GetSubCategoriesEvent extends SubCategoriesEvent{
  String categoryId;
  GetSubCategoriesEvent(this.categoryId);
}