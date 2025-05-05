import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_shop/core/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/features/product_info/presentation/provider/hide_show_bottom_nav.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/product_details/sections/image_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/widgets/loading_grid.dart';
import '../../../../data/model/product_details_model.dart';

class ImagesSlider extends StatefulWidget {
  final List<Images> images;

  const ImagesSlider({super.key, required this.images});

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: controller,
            itemCount: widget.images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Provider.of<HideShowBottomNavProvider>(context, listen: false)
                      .hide();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ImageView(
                  //             image: widget.images[index].attachmentFile!)));
                  Navigator.pushNamed(
                    context,
                    ImageView.routeName,
                    arguments: widget.images[index].attachmentFile!,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CachedNetworkImage(
                    
                    imageUrl:widget.images[index].attachmentFile!,
                    placeholder: (context, url) => loadingItem(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                ),
              );
            },
          ),
        ),
        SmoothPageIndicator(
            controller: controller, // PageController
            count: widget.images.length,
            effect: WormEffect(
                radius: 10,
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor:
                    ColorsManager.cyanColor), // your preferred effect
            onDotClicked: (index) {})
      ],
    );
  }
}
