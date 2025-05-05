import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/order_history/sections/completed.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/order_history/sections/ongoing.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../core/resources/constants/strings_manager.dart';

class OrderHistory extends StatefulWidget {
  static const String routeName = "/order_history";
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.orderHistory),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              labelColor: ColorsManager.whiteColor,
              labelStyle: context
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w700),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
                color: ColorsManager.blackColor,
              ),
              tabs: [
                Tab(text: StringsManager.ongoing),
                Tab(text: StringsManager.completed)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: TabBarView(
                    controller: _tabController,
                    children: [Ongoing(), Completed()]))
          ],
        ),
      ),
    );
  }
}
