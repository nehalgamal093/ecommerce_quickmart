import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/core/widgets/loading_list.dart';
import 'package:ecommerce_shop/features/cart/presentation/bloc/my_cart_bloc.dart';
import 'package:ecommerce_shop/features/cart/presentation/screens/my_cart/widgets/cart_list.dart';
import 'package:ecommerce_shop/features/cart/presentation/screens/my_cart/widgets/price_info.dart';
import 'package:ecommerce_shop/features/cart/presentation/screens/my_cart/widgets/voucher_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/colors/colors_manager.dart';
import '../../../../profile/presentation/screens/check_out/check_out.dart';
import '../../../data/models/cart_model.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final TextEditingController voucherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<MyCartBloc, MyCartState>(builder: (context, state) {
        if (state is ItemsLoading) {
          return LoadingList();
        } else if (state is ItemsError) {
          return Text('Error');
        } else if (state is ItemsLoaded) {
          final bloc = context.read<MyCartBloc>();
          List<CartItem> cartItems = state.items;
          return Scaffold(
            appBar: AppBar(
              title: Text('My Cart'),
              actions: [
                TextButton(
                  onPressed: () {
                    showVoucherBottomSheet(context, voucherController, bloc);
                  },
                  child: Text(
                    'Voucher Code',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorsManager.cyanColor),
                  ),
                ),
                SizedBox(
                  width: 16,
                )
              ],
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: PriceInfo(
                          totalPrice: state.totalPrice.toString(),
                          discount: state.discount),
                    ),
                    CartList(
                      cartItems: cartItems,
                    ),
                    SliverToBoxAdapter(
                      child: CustomBtnWidget(
                        title: "Checkout",
                        count: '(${state.items.length.toString()})',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Checkout(
                                cartItems: state.items,
                                totalPrice: state.totalPrice,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 15,
                      ),
                    ),
                  ],
                )),
          );
        } else {
          return Text('Error');
        }
      }),
    );
  }
}
