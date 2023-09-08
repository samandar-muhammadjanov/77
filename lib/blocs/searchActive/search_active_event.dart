part of 'search_active_bloc.dart';

class SearchActiveEvent extends Equatable {
  const SearchActiveEvent();

  @override
  List<Object> get props => [];
}

class ActiveSearchEvent extends SearchActiveEvent {}

class DisactiveSearchEvent extends SearchActiveEvent {}
