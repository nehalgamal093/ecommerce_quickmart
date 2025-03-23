import 'package:ecommerce_shop/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:ecommerce_shop/provider/main_provider.dart';
import 'package:ecommerce_shop/provider/old_new_screen.dart';
import 'package:ecommerce_shop/provider/order_tracking_state.dart';
import 'package:ecommerce_shop/provider/validate_provider.dart';
import 'package:ecommerce_shop/view/screen/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'core/caching/cache_helper.dart';
import 'core/di/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  configureDependencies();
  runApp(

      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>getIt<ProductInfoBloc>())
        ],
        child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => MainProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => OrderTrackingState(),
          ),
          ChangeNotifierProvider(
            create: (_) => OldNewScreen(),
          ),
          ChangeNotifierProvider(
            create: (_) => ValidateProvider(),
          ),
        
        ],
        child: const MyApp(),
            ),
      ),
  );
}
