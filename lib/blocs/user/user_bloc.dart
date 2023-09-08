import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hakaton_uic/domain/models/user_model.dart';
import 'package:hakaton_uic/domain/repositories/repositories.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUserDataEvent>((event, emit) async {
      try {
        emit(UserLoading());
        final userData = await Repository().getUserData(event.context);
        emit(UserLoaded(userData));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
