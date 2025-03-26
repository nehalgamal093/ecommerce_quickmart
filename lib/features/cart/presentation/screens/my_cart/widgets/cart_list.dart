import 'package:ecommerce_shop/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_shop/features/cart/presentation/bloc/my_cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/product_tile_widget.dart';

class CartList extends StatelessWidget {
  final List<CartItem> cartItems;
  const CartList({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ProductTileWidget(
            isWishlist: true,
            name: cartItems[index].product!.title!,
            description: cartItems[index].product!.description!,
            image: cartItems[index].product!.images![0].attachmentFile!,
            price: cartItems[index].product!.priceAfterDiscount.toString(),
            priceAfterDiscount: cartItems[index].product!.price.toString(),
            id: cartItems[index].product!.id!,
            onTap: () {
              context
                  .read<MyCartBloc>()
                  .add(DeleteItem(index, cartItems[index].product!.id!));
              // showDeleteBottomSheet(context,cartItems[index].product!.id!,index);
            },
          );
        });
  }
}
