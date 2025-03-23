import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/core/widgets/loading_grid.dart';
import 'package:ecommerce_shop/core/widgets/product_tile_widget.dart';
import 'package:ecommerce_shop/features/wish_list/presentation/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: BlocProvider(
        create: (context) => getIt<WishlistBloc>()..add(GetWishlistEvent()),
        child:
            BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
          if (state.wishlistRequestState == WishlistRequestState.loading) {
            return LoadingGrid(height: 100);
          } else if (state.wishlistRequestState == WishlistRequestState.error) {
            return Text('Error');
          } else if (state.wishlistRequestState ==
              WishlistRequestState.success) {
            return ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                      isWishlist: true,
                      name: state.wishlistModel!.resultList![index].title!,
                      description:
                          state.wishlistModel!.resultList![index].description!,
                      image: state.wishlistModel!.resultList![index]
                          .imagesList![0].attachmentFile!,
                      price: state.wishlistModel!.resultList![index].price!
                          .toString(),
                      priceAfterDiscount: state
                          .wishlistModel!.resultList![index].priceAfterDiscount!
                          .toString());
                });
          } else {
            return SizedBox();
          }
        }),
      ),
    );
  }
}
