import '../file_imports/file_imports.dart';

class ProductsList extends StatelessWidget {
  final Products products;
  const ProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Expanded(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  childAspectRatio: 150 / 270),
              itemCount: products.result!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      RouteAnimation.createRoute(
                        ProductDetails(id: products.result![index].id!),
                      ),
                    );
                  },
                  child: ProductItem(productModel: products.result![index]),
                );
              }),
        )
      ],
    );
  }
}

