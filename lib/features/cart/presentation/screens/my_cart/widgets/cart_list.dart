import 'package:ecommerce_shop/core/widgets/loading_grid.dart';
import 'package:ecommerce_shop/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_shop/features/cart/presentation/bloc/my_cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/product_tile_widget.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCartBloc, MyCartState>(
      builder: (context,state) {
        if(state is ItemsLoading){
          return LoadingGrid(height: 100);
        } else if(state is ItemsError){
          return Text('Error');
        } else if(state is ItemsLoaded){
          return ListView.builder(
              itemCount:state.items.length,
              itemBuilder: (context, index) {
                List<CartItem> cartItems = state.items;
                return ProductTileWidget(
                  isWishlist: true,
                  name:cartItems[index].product!.title!,
                  description:cartItems[index].product!.description!,
                  image: cartItems[index].product!.images![0].attachmentFile!,
                  price: cartItems[index].product!.priceAfterDiscount.toString(),
                  priceAfterDiscount: cartItems[index].product!.price.toString(),
                    id: cartItems[index].product!.id!,
                  onTap: (){
                    context.read<MyCartBloc>().add(DeleteItem(index,cartItems[index].product!.id!));
                    // showDeleteBottomSheet(context,cartItems[index].product!.id!,index);
                  },
                );
              });
        } else {
          return SizedBox();
        }

      }
    );
  }
}
