part of 'search_active_bloc.dart';

class SearchActiveState extends Equatable {
  final bool isActive;
  const SearchActiveState(this.isActive);

  @override
  List<Object> get props => [isActive];
}

final class SearchActiveInitial extends SearchActiveState {
  const SearchActiveInitial({required bool isActive}) : super(isActive);
}
