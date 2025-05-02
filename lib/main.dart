import 'package:ecommerce_shop/features/cart/presentation/bloc/my_cart_bloc.dart';
import 'package:ecommerce_shop/features/map/presentation/provider/map_provider.dart';
import 'package:ecommerce_shop/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:ecommerce_shop/features/profile/presentation/provider/address_radio_provider.dart';
import 'package:ecommerce_shop/features/profile/presentation/provider/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'core/caching/cache_helper.dart';
import 'core/di/di.dart';
import 'features/app/my_app.dart';
import 'features/auth/presentation/provider/obscure_password_provider.dart';
import 'features/auth/presentation/provider/validate_provider.dart';
import 'features/main/presentation/provider/main_provider.dart';
import 'features/main/presentation/provider/order_tracking_state.dart';
import 'features/product_info/presentation/provider/hide_show_bottom_nav.dart';
import 'features/products/presentation/bloc/products_bloc.dart';
import 'features/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'features/profile/presentation/provider/old_new_screen.dart';
import 'features/profile/presentation/screens/shipping_address/providers/cities_province_provider.dart';
import 'features/wish_list/presentation/bloc/wishlist_bloc/wishlist_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await CacheHelper.init();

  configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProductInfoBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProfileBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<MyCartBloc>()
            ..add(
              LoadCartItems(),
            ),
        ),
        BlocProvider(
          create: (context) => getIt<WishlistBloc>()
            ..add(
              LoadItems(),
            ),
        ),
        BlocProvider(
          create: (context) => getIt<ProductsBloc>()
            ..add(
              GetProductsEvent(subCategoryId: "67d866f11b503c79935b0642"),
            ),
        )
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
          ChangeNotifierProvider(
            create: (_) => PaymentProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => HideShowBottomNavProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => MapProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => AddressRadioProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
