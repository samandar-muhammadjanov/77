part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class GetProductsEvent extends ProductEvent {
  final String parameters;
  GetProductsEvent(this.parameters);
}
