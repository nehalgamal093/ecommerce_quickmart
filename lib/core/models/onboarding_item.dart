import '../resources/assets_manager/images_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingItemModel {
  final String title;
  final String description;
  final String image;

  OnBoardingItemModel(
      {required this.title, required this.description, required this.image});

  static get getLength => onboardingList.length;

  static OnBoardingItemModel getOnBoardingItem(int index) {
    return onboardingList[index];
  }

  static List<OnBoardingItemModel> onboardingList = [
    OnBoardingItemModel(
        title: StringsManager.onBoardingTitle1,
        description: StringsManager.onBoardingDescription1,
        image: ImagesManager.onBoarding1),
    OnBoardingItemModel(
        title: StringsManager.onBoardingTitle2,
        description: StringsManager.onBoardingDescription2,
        image: ImagesManager.onBoarding2),
    OnBoardingItemModel(
        title: StringsManager.onBoardingTitle3,
        description: StringsManager.onBoardingDescription3,
        image: ImagesManager.onBoarding3),
  ];
}
