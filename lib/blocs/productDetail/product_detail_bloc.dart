import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hakaton_uic/domain/models/product_detail_model.dart';
import 'package:hakaton_uic/domain/repositories/repositories.dart';
import 'package:meta/meta.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<GetProductDetail>((event, emit) async {
      try {
        emit(ProductDetailLoading());
        final productDetail =
            await Repository().getProductDetail(event.slug, event.context);
        emit(ProductDetailLoaded(productDetail));
      } catch (e) {
        emit(ProductDetailError(e.toString()));
      }
    });
  }
}
