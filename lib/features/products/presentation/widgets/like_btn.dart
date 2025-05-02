import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/assets_manager/images_manager.dart';
import '../../../../core/resources/colors/colors_manager.dart';
import '../../../wish_list/presentation/bloc/like_dislike_bloc/like_or_dislike_bloc.dart';
import '../../../wish_list/presentation/bloc/wishlist_bloc/wishlist_bloc.dart';

class LikeBtn extends StatelessWidget {
  final String id;
  const LikeBtn({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<LikeOrDislikeBloc>()..add(IsProductLikedEvent(id: id)),
      child: BlocConsumer<LikeOrDislikeBloc, LikeOrDislikeState>(
          listener: (context, state) {
        if (state is LikedState || state is DislikeState) {
          context.read<WishlistBloc>().add(LoadItems());
        }
      }, builder: (context, state) {
        return BlocBuilder<LikeOrDislikeBloc, LikeOrDislikeState>(
            builder: (context, state) {
          if (state is DislikeState) {
            return InkWell(
              onTap: () {
                context
                    .read<LikeOrDislikeBloc>()
                    .add(AddToWishlistEvent(productId: id));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManager.blackColor,
                ),
                child: ImageIcon(
                  AssetImage(ImagesManager.heartIcon),
                  color: ColorsManager.whiteColor,
                  size: 20,
                ),
              ),
            );
          } else {
            return InkWell(
              onTap: () {
                context
                    .read<LikeOrDislikeBloc>()
                    .add(DeleteFromWishlistEvent(productId: id));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManager.blackColor,
                ),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            );
          }
        });
      }),
    );
  }
}
