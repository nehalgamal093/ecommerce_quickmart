import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

import '../../../provider/hide_show_bottom_nav.dart';

class ImageView extends StatelessWidget {
  static const String routeName = '/image-view';
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    String image = ModalRoute.of(context)!.settings.arguments as String;

    return PopScope(
      onPopInvoked: (val) {
        Provider.of<HideShowBottomNavProvider>(context, listen: false).show();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: PhotoView(
                  imageProvider: NetworkImage(image),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Provider.of<HideShowBottomNavProvider>(context,
                            listen: false)
                        .show();
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
