part of 'bloc_product_bloc.dart';

@immutable
sealed class BlocProductState {}
class initstate extends BlocProductState{}
class LoadingState extends BlocProductState{

}
class GetProductsSuccessfully extends BlocProductState{
late List<Products> products ;
GetProductsSuccessfully({required this.products});
}
class ErrorState extends BlocProductState{}
class GetOneProductSuccessfully extends BlocProductState{
  Products product ;
  GetOneProductSuccessfully({required this.product});
}