import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../../core/widgets/custom_btn_widget.dart';
import '../../../bloc/product_info_bloc.dart';

class ButtonsSection extends StatelessWidget {
  final String id;
  const ButtonsSection({super.key, required this.id});

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
            child: BlocConsumer<ProductInfoBloc, ProductsInfoState>(
                listener: (context, state) {
          if (state.addToCartRequestState == ProductsInfoRequestState.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Product added to cart'),
              ),
            );
          } else if (state.addToCartRequestState ==
              ProductsInfoRequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.failures!.message!),
              ),
            );
          }
        }, builder: (context, state) {
               if (state.addToCartRequestState ==
              ProductsInfoRequestState.loading) {
                 return CustomBtnWidget(
                     title: 'Loading',
                     onPressed: () {
                     });
              }
          return CustomBtnWidget(
              title: 'Add to cart',
              onPressed: () {
                context.read<ProductInfoBloc>().add(AddToCartEvent(id));
              });
        }))
      ],
    );
  }
}
