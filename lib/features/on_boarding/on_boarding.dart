import 'package:ecommerce_shop/features/on_boarding/widgets/on_boarding_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/models/onboarding_item.dart';
import '../../core/resources/colors/colors_manager.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding';
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: size.height * .78,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: OnBoardingItemModel.getLength,
                  itemBuilder: (context, index) {
                    return OnBoardingItem(
                      onPressed: () {
                        pageController.nextPage(
                            duration: Duration(milliseconds: 700),
                            curve: Curves.easeInCubic);
                      },
                      item: OnBoardingItemModel.getOnBoardingItem(index),
                      index: index,
                    );
                  }),
            ),
            SizedBox(
              height: 29,
            ),
            SmoothPageIndicator(
                controller: pageController, // PageController
                count: 3,
                effect: WormEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: ColorsManager.cyanColor),
                onDotClicked: (index) {})
          ],
        ),
      ),
    );
  }
}
