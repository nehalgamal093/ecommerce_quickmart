import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  static String login = dotenv.env['LOGIN_ENDPOINT']!;
  static String register = dotenv.env['REGISTER_ENDPOINT']!;
  static String categories = dotenv.env['CATEGORIES_ENDPOINT']!;
  static String subCategories(String id) => "/categories/$id/subcategories";
  static String products(String id) => "/products?subCategory=$id";
  static String search(String keyword) => "/products?keyword=$keyword";
  static String reviews(String id) => "/reviews?product=$id";
  static String writeReview = dotenv.env['REVIEWS_ENDPOINT']!;
  static String product(String id) => "/products/$id";
  static String wishList = dotenv.env['WISHLIST_ENDPOINT']!;
  static String cart = dotenv.env['CART_ENDPOINT']!;
  static String applyCoupon = dotenv.env['APPLY_COUPON_ENDPOINT']!;
  static String user(String id) => "/users/$id";
  static String changePassword(String id) => "/users/changeUserPassword/$id";
  static String addresses = dotenv.env['ADDRESSES_ENDPOINT']!;
  static String paymentRequest = dotenv.env['PAYMENT_REQUEST']!;
}
