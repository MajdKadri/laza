import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:laza/Model/products.dart';
import 'package:laza/services/product_service.dart';
import 'package:meta/meta.dart';

part 'bloc_product_event.dart';

part 'bloc_product_state.dart';

class BlocProductBloc extends Bloc<BlocProductEvent, BlocProductState> {
  BlocProductBloc() : super(LoadingState()) {
    on<BlocProductEvent>((event, emit) async {
      dynamic result = await ProductServiceGet().getallproducts();
      if (result == false ) {
        emit(ErrorState());
      }
      else {
        emit(GetProductsSuccessfully(products: result));
      }
    }
    );
    on <BlocGetOne>((event,emit)async{
      emit(LoadingState());
       dynamic result = ProductServiceGet().getoneproduct(event.id);
       if (result == false){
         emit (ErrorState());
       }else {
         emit (GetOneProductSuccessfully(product: result));
       }

    });
  }
}
