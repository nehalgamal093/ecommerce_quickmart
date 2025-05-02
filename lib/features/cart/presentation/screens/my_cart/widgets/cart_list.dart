import 'package:ecommerce_shop/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_shop/features/cart/presentation/bloc/my_cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/product_tile_widget.dart';
import '../../../../../wish_list/presentation/screens/wishlist/widgets/delete_bottom_sheet.dart';

class CartList extends StatelessWidget {
  final List<CartItem> cartItems;
  const CartList({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(childCount: cartItems.length,
          (context, index) {
        return ProductTileWidget(
          isWishlist: true,
          name: cartItems[index].product!.title!,
          description: cartItems[index].product!.description!,
          image: cartItems[index].product!.images![0].attachmentFile!,
          price: cartItems[index].product!.priceAfterDiscount.toString(),
          priceAfterDiscount: cartItems[index].product!.price.toString(),
          id: cartItems[index].product!.id!,
          onTap: () {
            final bloc = context.read<MyCartBloc>();
            showDeleteBottomSheet(
                context, cartItems[index].product!.id!, index, bloc);
          },
        );
      }),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 1,
          childAspectRatio: 150 / 65),
    );
  }
}
