import 'package:ecommerce_shop/core/widgets/error_widget.dart';
import 'package:ecommerce_shop/core/widgets/loading_list.dart';
import 'package:ecommerce_shop/features/wish_list/presentation/screens/wishlist/widgets/wish_list_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/assets_manager/images_manager.dart';
import '../../../../../core/resources/constants/strings_manager.dart';
import '../../bloc/wishlist_bloc/wishlist_bloc.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.wishlist),
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
        if (state is WishlistLoading) {
          return LoadingList();
        } else if (state is WishlistError) {
          return SomethingWentWrongWidget(
              title: StringsManager.somethingWentWrong,
              img: ImagesManager.somethingWrong);
        } else if (state is WishlistLoaded) {
          return WishListList(list: state.list);
        } else {
          return SizedBox();
        }
      }),
    );
  }
}
