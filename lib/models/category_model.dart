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
    CategoryModel(title: StringsManager.electronics, image: ImagesManager.tv),
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

  static List<CategoryModel> subCategories = [
    CategoryModel(
        title: StringsManager.labTops, image: ImagesManager.product11),
    CategoryModel(
        title: StringsManager.mobilePhone, image: ImagesManager.product10),
    CategoryModel(
        title: StringsManager.headphones, image: ImagesManager.product12),
    CategoryModel(
        title: StringsManager.smartWatches, image: ImagesManager.product9),
    CategoryModel(
        title: StringsManager.mobileCases, image: ImagesManager.product8),
    CategoryModel(
        title: StringsManager.monitors, image: ImagesManager.product7),
    CategoryModel(
        title: StringsManager.earPhones, image: ImagesManager.product6),
    CategoryModel(
        title: StringsManager.chargers, image: ImagesManager.product5),
  ];
}
