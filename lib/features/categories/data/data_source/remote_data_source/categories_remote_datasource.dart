import 'package:ecommerce_shop/features/categories/data/models/categories.dart';

abstract class CategoriesRemoteDataSource {
  Future<Categories> getCategories();
}
