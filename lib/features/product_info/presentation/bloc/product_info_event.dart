part of 'product_info_bloc.dart';


abstract class ProductInfoEvent {}

class GetReviewsEvent extends ProductInfoEvent{
  final String id;
  GetReviewsEvent(this.id);
}

class WriteReviewEvent extends ProductInfoEvent{
  final ReviewRequestModel requestModel;
  WriteReviewEvent(this.requestModel);
}