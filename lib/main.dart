import 'package:ecommerce_shop/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'core/caching/cache_helper.dart';
import 'core/di/di.dart';
import 'core/provider/main_provider.dart';
import 'core/provider/old_new_screen.dart';
import 'core/provider/order_tracking_state.dart';
import 'core/provider/validate_provider.dart';
import 'features/app/my_app.dart';
import 'features/auth/presentation/provider/obscure_password_provider.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'features/profile/presentation/screens/shipping_address/providers/cities_province_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  configureDependencies();
  runApp(

      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>getIt<ProductInfoBloc>()),
          BlocProvider(create: (context)=>getIt<ProfileBloc>()),
        ],
        child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ObscurePasswordProvider(),
          ),
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
          ChangeNotifierProvider(
            create: (_) => CityProvinceProvider(),
          ),
        ],
        child: const MyApp(),
            ),
      ),
  );
}
