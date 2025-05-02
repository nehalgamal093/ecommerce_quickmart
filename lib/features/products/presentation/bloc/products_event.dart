part of 'products_bloc.dart';

abstract class ProductsEvent {}

class GetProductsEvent extends ProductsEvent {
  final String subCategoryId;
  GetProductsEvent({required this.subCategoryId});
}

