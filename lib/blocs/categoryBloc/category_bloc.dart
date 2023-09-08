import 'package:bloc/bloc.dart';
import 'package:hakaton_uic/domain/models/categories_model.dart';
import 'package:hakaton_uic/domain/repositories/repositories.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    Repository _repository = Repository();
    on<GetCategoriesEvent>((event, emit) async {
      try {
        emit(CategoryLoading());
        final category = await _repository.getCategories();
        emit(CategoryLoaded(category));
      } catch (e) {
        emit(
          CategoryError(
            e.toString(),
          ),
        );
      }
    });
  }
}
