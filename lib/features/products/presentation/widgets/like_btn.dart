import 'package:ecommerce_shop/features/products/presentation/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../view/resources/assets_manager/images_manager.dart';
import '../../../../view/resources/colors/colors_manager.dart';

class LikeBtn extends StatelessWidget {
  final String id;
  const LikeBtn({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>getIt<ProductsBloc>()..add(IsProductLikedEvent(id: id)),
      child: BlocBuilder<ProductsBloc,ProductsState>(
        builder: (context,state) {
          if(state.likeOrDisLikeState == LikeOrDisLikeState.disliked){
            return InkWell(
              onTap: (){
                context.read<ProductsBloc>().add(AddToWishlistEvent(productId: id));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
          }else {
            return InkWell(
              onTap: (){
                context.read<ProductsBloc>().add(DeleteFromWishlistEvent(productId: id));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManager.blackColor,
                ),
                child: Icon(Icons.favorite,color: Colors.red,size: 20,)
              ),
            );
          }

        }
      ),
    );
  }
}
