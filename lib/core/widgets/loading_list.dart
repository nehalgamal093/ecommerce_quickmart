import 'package:flutter/material.dart';

import '../resources/colors/colors_manager.dart';

class LoadingList extends StatelessWidget {
  const LoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(8, (index) {
          if (index == 0) {
            return SizedBox(
              height: 50,
            );
          } else if (index % 2 == 0) {
            return Row(
              children: [
                Container(
                  width: size.width * .4,
                  height: size.height * .25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsManager.veryLightGreyColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: size.height * .25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width * .4,
                        height: size.height * .05,
                        decoration: BoxDecoration(
                          color: ColorsManager.veryLightGreyColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: size.width * .3,
                        height: size.height * .05,
                        decoration: BoxDecoration(
                          color: ColorsManager.veryLightGreyColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return SizedBox(
              height: 10,
            );
          }
        }),
      ),
    ));
  }
}
