import '../../file_imports/file_imports.dart';

class CategoryListItem extends StatelessWidget {
  final Result categoryModel;

  const CategoryListItem({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsManager.veryLightGreyColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: categoryModel.image!,
            placeholder: (context, url) => loadingItem(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            categoryModel.name ?? "",
            style: context.bodyMedium,
          ),
        ],
      ),
    );
  }
}
