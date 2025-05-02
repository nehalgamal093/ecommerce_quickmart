import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../../core/resources/constants/strings_manager.dart';
import '../../../provider/payment_provider.dart';
import '../widgets/title_details_widget.dart';

class ReviewSection extends StatelessWidget {
  final num totalPrice;
  const ReviewSection({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    var paymentProvider = Provider.of<PaymentProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .8,
      height: size.height * .7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>Items()));
            },
            child: Row(
              children: [
                Text(
                  StringsManager.items,
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
            StringsManager.shippingAddress,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorsManager.blackColor),
          ),
          SizedBox(
            height: 20,
          ),
          TitleDetailsWidget(
              title: StringsManager.fullName,
              details: paymentProvider.billingData.firstName ?? ""),
          SizedBox(
            height: 15,
          ),
          TitleDetailsWidget(
              title: StringsManager.mobilePhone,
              details: paymentProvider.billingData.phoneNumber ?? ""),
          SizedBox(
            height: 15,
          ),
          TitleDetailsWidget(
              title: StringsManager.province,
              details: paymentProvider.billingData.state ?? ""),
          SizedBox(
            height: 15,
          ),
          TitleDetailsWidget(
              title: StringsManager.city,
              details: paymentProvider.billingData.city ?? ""),
          SizedBox(
            height: 15,
          ),
          TitleDetailsWidget(
              title: StringsManager.streetAddress,
              details: paymentProvider.billingData.street ?? ""),
          SizedBox(
            height: 15,
          ),
          TitleDetailsWidget(
              title: StringsManager.postalCode, details: "92988484"),
          Divider(
            color: ColorsManager.veryLightGreyColor,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            StringsManager.orderInfo,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorsManager.blackColor),
          ),
          SizedBox(
            height: 15,
          ),
          TitleDetailsWidget(
              title: StringsManager.subtotal,
              details: '\$${totalPrice.toString()}'),
          SizedBox(
            height: 15,
          ),
          TitleDetailsWidget(
              title: StringsManager.shippingCost, details: '\$0.00'),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  StringsManager.total,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorsManager.blackColor),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  '\$${totalPrice.toString()}',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorsManager.blackColor),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
