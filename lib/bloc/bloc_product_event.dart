part of 'bloc_product_bloc.dart';

@immutable
sealed class BlocProductEvent {}
class BlocProductsGet extends BlocProductEvent{

}
class BlocGetOne extends BlocProductEvent{
num id = 1;
BlocGetOne({required this.id});
}