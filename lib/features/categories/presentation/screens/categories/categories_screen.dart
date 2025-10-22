import '../file_imports/file_imports.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/categories';
  const CategoriesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: BlocProvider(
        create: (context) => getIt<CategoriesBloc>()..add(GetCategoriesEvent()),
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
          if (state.categoriesRequestState == CategoriesRequestState.loading) {
            return LoadingGrid(
              height: 100,
            );
          } else if (state.categoriesRequestState ==
              CategoriesRequestState.error) {
            return Text('Error');
          } else if (state.categoriesRequestState ==
              CategoriesRequestState.success) {
            return Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: state.categories?.result?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 10,
                          childAspectRatio: 160 / 100),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              RouteAnimation.createRoute(
                                SubCategoriesScreen(
                                    title:
                                        state.categories!.result![index].name!,
                                    id: state.categories!.result![index].id!),
                              ),
                            );
                          },
                          child: CategoryListItem(
                            categoryModel: state.categories!.result![index],
                          ),
                        );
                      }),
                )
              ],
            );
          }
          return SizedBox();
        }),
      ),
    );
  }
}
