import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/core/widgets/loading_list.dart';
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
        create: (context) => getIt<WishlistBloc>()..add(LoadItems()),
        child:
            BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
          if (state is WishlistLoading) {
            return LoadingList();
          } else if (state is WishlistError) {
            return Text('Error');
          } else if (state is WishlistLoaded) {
            return ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    isWishlist: true,
                    name: state.list[index].title!,
                    description:
                    state.list[index].description!,
                    image: state.list[index]
                        .imagesList![0].attachmentFile!,
                    price: state.list[index].price!
                        .toString(),
                    priceAfterDiscount:state.list[index].priceAfterDiscount!
                        .toString(),
                    id: state.list[index].id!,
                    onTap: () {
                      final bloc = context.read<WishlistBloc>();
                      bloc.add(DeleteItem(index, state.list[index].id!));
                    },
                  );
                });
          } else {
            return SizedBox();
          }
        }),
      ),
    );
  }
}
