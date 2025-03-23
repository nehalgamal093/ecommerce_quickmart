class EndPoints{
  static const String login= "/auth/signin";
  static const String register= "/auth/signup";
  static const String categories = "/categories";
  static String subCategories(String id) => "/categories/$id/subcategories";
  static String products(String id) => "/products?subCategory=$id";
  static  String reviews(String id) => "/reviews?product=$id";
  static const String writeReview = "/reviews";
  static  String product(String id) => "/products/$id";
  static const String wishList = "/wishlist";
}