part of 'product_detail_bloc.dart';

@immutable
sealed class ProductDetailEvent {}

class GetProductDetail extends ProductDetailEvent {
  final String slug;
  final BuildContext context;
  GetProductDetail(this.slug, this.context);
}
