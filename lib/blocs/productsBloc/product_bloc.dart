import 'package:bloc/bloc.dart';
import 'package:hakaton_uic/domain/models/products_model.dart';
import 'package:hakaton_uic/domain/repositories/repositories.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    Repository _repository = Repository();
    on<GetProductsEvent>(
      (event, emit) async {
        try {
          emit(ProductLoading());
          final products = await _repository.getProducts(event.parameters);
          emit(ProductLoaded(products));
        } catch (e) {
          emit(
            ProductError(
              e.toString(),
            ),
          );
        }
      },
    );
  }
}
