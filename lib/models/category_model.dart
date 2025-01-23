import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:ecommerce_shop/view/resources/strings_manager.dart';

class CategoryModel {
  String title;
  String image;

  CategoryModel({required this.title, required this.image});

  static CategoryModel getItem(int index) {
    return list[index];
  }

  static get length => list.length;
  static List<CategoryModel> list = [
    CategoryModel(
        title: StringsManager.electronics, image: ImagesManager.mobile),
    CategoryModel(title: StringsManager.fashion, image: ImagesManager.bag),
    CategoryModel(title: StringsManager.furniture, image: ImagesManager.sofa),
    CategoryModel(title: StringsManager.industrial, image: ImagesManager.car),
    CategoryModel(title: StringsManager.homeDecor, image: ImagesManager.gift),
    CategoryModel(title: StringsManager.health, image: ImagesManager.health),
    CategoryModel(
        title: StringsManager.constructionRealstate,
        image: ImagesManager.house),
    CategoryModel(
        title: StringsManager.fabricService, image: ImagesManager.fabric),
    CategoryModel(
        title: StringsManager.electricalEquipment,
        image: ImagesManager.electric),
  ];
}
