import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';

class ProductModel{
  String name;
  String price;
  String priceAfterDiscount;
  String image;
  
  ProductModel({required this.name,required this.price,required this.priceAfterDiscount,required this.image});
  
  static get length => products.length;
  
  static List<ProductModel> products = [
    ProductModel(name: 'Nike air jordan retro fashion', price: '\$126.00', priceAfterDiscount: '\$186.00', image: ImagesManager.product3),
    ProductModel(name: 'Classic new black glasses', price: '\$18.50', priceAfterDiscount: '\$10.00', image: ImagesManager.product2),
    ProductModel(name: 'P47 Wireless headphones', price: '\$38.45.00', priceAfterDiscount: '\$42.75', image: ImagesManager.product4),
    ProductModel(name: 'Brown box Luxury Bag fror', price: '\$98.00', priceAfterDiscount: '\$122.00', image: ImagesManager.product1),
  ];
}