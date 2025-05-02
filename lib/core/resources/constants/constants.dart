import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static const String baseUrl = "https://ecommerce-nodejs-mu.vercel.app/api/v1";
  static String payMobToken = dotenv.env['PAY_MOB_TOKEN']!;
  static String categoryID = dotenv.env['CATEGORY_ID']!;
}
