import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/core/widgets/loading_grid.dart';
import 'package:ecommerce_shop/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../view/resources/colors/colors_manager.dart';

class ProductReviewsSection extends StatelessWidget {
  final String id;
  const ProductReviewsSection({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 250,minHeight: 10),

        child: BlocProvider(
          create: (context)=>getIt<ProductInfoBloc>()..add(GetReviewsEvent(id)),
          child: BlocBuilder<ProductInfoBloc,ProductsInfoState>(
            builder: (context,state) {
             if(state.productsInfoRequestState ==ProductsInfoRequestState.loading){
               return LoadingGrid(height: 100);
             }else if(state.productsInfoRequestState ==ProductsInfoRequestState.error){
               return Text('Error');
             } else if(state.productsInfoRequestState ==ProductsInfoRequestState.success){
               return state.reviews!.result!.isEmpty?SizedBox():Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: List.generate(
                     getLength(state.reviews!.result!.length), (index){
                   return Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         state.reviews!.result![index].user!.name!,
                         style:
                         Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
                       ),
                       SizedBox(
                         height: 5,
                       ),
                       RatingBar.builder(
                         initialRating: 3,
                         minRating: 1,
                         itemSize: 14,
                         direction: Axis.horizontal,
                         allowHalfRating: true,
                         itemCount: 5,
                         unratedColor: ColorsManager.veryLightGreyColor,
                         itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                         itemBuilder: (context, _) => Icon(
                           Icons.star,
                           color: Colors.amber,
                         ),
                         onRatingUpdate: (rating) {},
                       ),
                       SizedBox(
                         height: 5,
                       ),
                       Text(
                         state.reviews!.result![index].comment!,
                         style: Theme.of(context).textTheme.bodySmall,
                       ),
                       SizedBox(
                         height: 10,
                       )
                     ],
                   );
                 }),
               );

             } else{
               return SizedBox();
             }
            }
          ),
        ),
      ),
    );
  }
  int getLength(int index){
    if(index>5){
      return 5;
    } else{
      return index;
    }
  }
}
