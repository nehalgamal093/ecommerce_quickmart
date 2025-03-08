import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/core/widgets/product_tile_widget.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/screen/check_out/check_out.dart';
import 'package:ecommerce_shop/view/screen/my_cart/widgets/voucher_bottom_sheet.dart';
import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        actions: [
          TextButton(
            onPressed: (){
              showVoucherBottomSheet(context);
            },
            child: Text('Voucher Code',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600, color: ColorsManager.cyanColor),)
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder:(context,index){
                    return ProductTileWidget();
                  }),
            ),
            Text('Order Info',style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize:16),),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sub Total',style: Theme.of(context).textTheme.bodySmall,),
                Text('\$27.25',style: Theme.of(context).textTheme.bodySmall,)
              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping Cost',style: Theme.of(context).textTheme.bodySmall,),
                Text('\$0.00',style: Theme.of(context).textTheme.bodySmall,)
              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize:16),),
                Text('\$27.25',style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize:16),)
              ],
            ),
            SizedBox(height: 15,),
            CustomBtnWidget(title: "Checkout",count: "(2)",onPressed: (){
              Navigator.pushNamed(context, Checkout.routeName);
            },),
            SizedBox(height: 15,),
          ],
        ),
      )
    );
  }
}
