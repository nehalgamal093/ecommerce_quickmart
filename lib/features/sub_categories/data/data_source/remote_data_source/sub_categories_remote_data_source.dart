import 'package:ecommerce_shop/features/categories/data/models/categories.dart';

abstract class SubCategoriesRemoteDataSource {
  Future<Categories> getSubCategories(String categoryId);
}
