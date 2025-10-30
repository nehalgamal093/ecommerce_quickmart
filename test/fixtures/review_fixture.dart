import 'package:ecommerce_shop/features/product_info/data/model/review.dart';

Result resultFixture = Result(
  id: "67dc957630b82aef2affbcde",
  comment: "Nice",
  product: "67d75ac5d7c6ee4f73f543ba",
  user: User(id: "67dc953730b82aef2affbcd5", name: "ahmed"),
  ratings: 5,
  createdAt: "2025-03-20T22:23:50.962Z",
  updatedAt: "2025-03-20T22:23:50.962Z",
);
Review reviewFixture = Review(message: "success", page: 1, result: [resultFixture]);
