import 'package:ecommerce_shop/provider/main_provider.dart';
import 'package:ecommerce_shop/view/screen/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}
