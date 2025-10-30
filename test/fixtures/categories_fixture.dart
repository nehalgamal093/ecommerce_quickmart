import 'package:ecommerce_shop/features/categories/presentation/screens/file_imports/file_imports.dart';

Map<String, dynamic> categoriesForJsonFixture() => {
      "message": "success",
      "page": 1,
      "result": [
        {
          "_id": "67d7248604bcc6a34fc4de86",
          "name": "Electronics",
          "slug": "electronics",
          "image":
              "https://res.cloudinary.com/doomfqwge/image/upload/v1742152837/hc1zxddjvbal5577jezx.png",
          "cloudinary_id": "q8o2urhcgknlmpmh67u9",
          "createdAt": "2025-03-16T19:20:38.753Z",
          "updatedAt": "2025-03-16T19:20:38.753Z",
          "__v": 0
        },
      ]
    };

Categories categories = Categories(message: 'success', page: 1, result: [
  Result(
      id: "67d7248604bcc6a34fc4de86",
      name: "Electronics",
      slug: "electronics",
      image: "",
      createdAt: "2025-03-16T19:20:38.753Z",
      updatedAt: "2025-03-16T19:20:38.753Z",
      v: 0)
]);
