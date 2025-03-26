import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/core/extensions/comma_seperated.dart';
import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/features/cart/presentation/bloc/my_cart_bloc.dart';
import 'package:ecommerce_shop/features/cart/presentation/screens/my_cart/widgets/cart_list.dart';
import 'package:ecommerce_shop/features/cart/presentation/screens/my_cart/widgets/voucher_bottom_sheet.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/screen/check_out/check_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/loading_grid.dart';
import '../../../data/models/cart_model.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Cart'),
          actions: [
            TextButton(
                onPressed: () {
                  showVoucherBottomSheet(context);
                },
                child: Text(
                  'Voucher Code',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorsManager.cyanColor),
                )),
            SizedBox(
              width: 16,
            )
          ],
        ),
        body: BlocProvider(
          create: (context) => getIt<MyCartBloc>()..add(LoadItems()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                BlocBuilder<MyCartBloc, MyCartState>(builder: (context, state) {
              if (state is ItemsLoading) {
                return LoadingGrid(height: 100);
              } else if (state is ItemsError) {
                return Text('Error');
              } else if (state is ItemsLoaded) {
                List<CartItem> cartItems = state.items;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CartList(
                        cartItems: cartItems,
                      ),
                    ),
                    Text(
                      'Order Info',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub Total',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          '\$${state.totalPrice.toString().insertCommas()}',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping Cost',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          '\$0.00',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 16),
                        ),
                        Text(
                          '\$${state.totalPrice.toString().insertCommas()}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomBtnWidget(
                      title: "Checkout",
                      count: '(${state.items.length.toString()})',
                      onPressed: () {
                        Navigator.pushNamed(context, Checkout.routeName);
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                );
              } else {
                return SizedBox();
              }
            }),
          ),
        ));
  }
}
