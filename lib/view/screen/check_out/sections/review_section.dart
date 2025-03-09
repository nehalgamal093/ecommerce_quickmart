import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/screen/check_out/sections/Items.dart';
import 'package:ecommerce_shop/view/screen/check_out/widgets/title_details_widget.dart';
import 'package:ecommerce_shop/view/screen/order_success/order_success.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/order_tracking_state.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OrderTrackingState>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, Items.routeName);
          },
          child: Row(
            children: [
              Text(
                'Items',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '(2)',
                style: TextStyle(fontSize: 14),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios_outlined)
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          color: ColorsManager.veryLightGreyColor,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Shipping Address',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ColorsManager.blackColor),
        ),
        SizedBox(
          height: 20,
        ),
        TitleDetailsWidget(title: 'Full Name', details: 'Nehal Gamal'),
        SizedBox(
          height: 15,
        ),
        TitleDetailsWidget(title: 'Mobile Number', details: '+201000-00000-0'),
        SizedBox(
          height: 15,
        ),
        TitleDetailsWidget(title: 'Province', details: 'Cairo'),
        SizedBox(
          height: 15,
        ),
        TitleDetailsWidget(title: 'City', details: 'Cairo'),
        SizedBox(
          height: 15,
        ),
        TitleDetailsWidget(title: 'Street Address', details: 'XYZ Address'),
        SizedBox(
          height: 15,
        ),
        TitleDetailsWidget(title: 'Postal Code', details: '75400'),
        Divider(
          color: ColorsManager.veryLightGreyColor,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Order Info',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ColorsManager.blackColor),
        ),
        SizedBox(
          height: 15,
        ),
        TitleDetailsWidget(title: 'Subtotal', details: '\$27.25'),
        SizedBox(
          height: 15,
        ),
        TitleDetailsWidget(title: 'Shipping Cost', details: '\$0.00'),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Text(
              'Total',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorsManager.blackColor),
            ),
            Spacer(),
            Text(
              '\$27.25',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorsManager.blackColor),
            )
          ],
        ),
        SizedBox(
          height: 40,
        ),
        CustomBtnWidget(title: 'Place Order', onPressed: () {
          provider.changeTrackingState(0);
          Navigator.pushNamed(context, OrderSuccess.routeName);

        })
      ],
    );
  }
}
