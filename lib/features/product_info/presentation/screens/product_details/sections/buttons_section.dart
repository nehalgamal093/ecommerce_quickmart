import 'package:ecommerce_shop/features/cart/presentation/bloc/my_cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../../core/resources/constants/strings_manager.dart';
import '../../../../../../core/widgets/custom_btn_widget.dart';

class ButtonsSection extends StatefulWidget {
  final String id;
  const ButtonsSection({super.key, required this.id});

  @override
  State<ButtonsSection> createState() => _ButtonsSectionState();
}

class _ButtonsSectionState extends State<ButtonsSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomBtnWidget(
            title: 'Buy Now',
            onPressed: () {},
            textColor: ColorsManager.blackColor,
            backgroundColor: ColorsManager.whiteColor,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child:
              BlocConsumer<MyCartBloc, MyCartState>(listener: (context, state) {
            if (state is ItemsLoaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(StringsManager.productAddedToCart),
                ),
              );
            } else if (state is ItemsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.failures.message!),
                ),
              );
            }
          }, builder: (context, state) {
            if (state is ItemsLoading) {
              return CustomBtnWidget(
                  title: StringsManager.loading, onPressed: () {});
            }
            return CustomBtnWidget(
                title: StringsManager.addToCart,
                onPressed: () {
                  context.read<MyCartBloc>().add(
                        AddToCartEvent(widget.id),
                      );
                });
          }),
        )
      ],
    );
  }
}
