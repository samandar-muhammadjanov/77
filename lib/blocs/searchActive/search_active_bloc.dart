import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_active_event.dart';
part 'search_active_state.dart';

class SearchActiveBloc extends Bloc<SearchActiveEvent, SearchActiveState> {
  SearchActiveBloc() : super(SearchActiveInitial(isActive: false)) {
    on<ActiveSearchEvent>((event, emit) {
      emit(const SearchActiveState(true));
    });
    on<DisactiveSearchEvent>((event, emit) {
      emit(const SearchActiveState(false));
    });
  }
}
