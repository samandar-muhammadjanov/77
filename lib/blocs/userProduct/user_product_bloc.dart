import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hakaton_uic/domain/models/user_products_model.dart';
import 'package:hakaton_uic/domain/repositories/repositories.dart';
import 'package:meta/meta.dart';

part 'user_product_event.dart';
part 'user_product_state.dart';

class UserProductBloc extends Bloc<UserProductEvent, UserProductState> {
  UserProductBloc() : super(UserProductInitial()) {
    on<GetUserProducts>((event, emit) async {
      try {
        emit(UserProductLoading());
        final userProducts = await Repository().getUserProducts(event.context);
        emit(UserProductLoaded(userProducts));
      } catch (e) {
        emit(UserProductError(e.toString()));
      }
    });
  }
}
