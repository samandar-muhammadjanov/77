part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  final List<Categories> categories;
  CategoryLoaded(this.categories);
}

final class CategoryError extends CategoryState {
  final String error;
  CategoryError(this.error);
}
