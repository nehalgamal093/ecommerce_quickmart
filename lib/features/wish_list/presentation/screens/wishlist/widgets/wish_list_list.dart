import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/product_tile_widget.dart';
import '../../../../../wish_list/data/models/wishlist_model.dart';
import '../../../bloc/wishlist_bloc/wishlist_bloc.dart';

class WishListList extends StatelessWidget {
  final List<Result> list;
  const WishListList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ProductTileWidget(
            isWishlist: true,
            name: list[index].title!,
            description: list[index].description!,
            image: list[index].imagesList![0].attachmentFile!,
            price: list[index].price!.toString(),
            priceAfterDiscount: list[index].priceAfterDiscount!.toString(),
            id: list[index].id!,
            onTap: () {
              final bloc = context.read<WishlistBloc>();
              bloc.add(
                DeleteItem(index, list[index].id!),
              );
              // final bloc2 = context.read<ProductsBloc>();
              // bloc2.add(
              //   GetProductsEvent(subCategoryId: StringsManager.subCategoryId),
              // );
            },
          );
        });
  }
}
