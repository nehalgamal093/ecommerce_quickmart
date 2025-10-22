import '../file_imports/file_imports.dart';

class ProductsScreen extends StatelessWidget {
  final String id;
  final String title;
  static const String routeName = '/products_screen';
  const ProductsScreen({super.key, required this.id,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocProvider(
          create: (context) => getIt<ProductsBloc>()
            ..add(
              GetProductsEvent(subCategoryId: id),
            ),
          child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
            ProductsRequestState requestState = state.productsRequestState!;
            if (requestState == ProductsRequestState.loading) {
              return LoadingGrid(height: 200);
            } else if (requestState == ProductsRequestState.error) {
              return SomethingWentWrongWidget(
                  title: StringsManager.somethingWentWrong,
                  img: ImagesManager.somethingWrong);
            } else if (requestState == ProductsRequestState.success) {
              return ProductsList(products: state.products!);
            } else {
              return SizedBox();
            }
          }),
        ),
      ),
    );
  }
}
