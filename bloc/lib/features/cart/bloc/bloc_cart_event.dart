part of 'bloc_cart_bloc.dart';

@immutable
abstract class BlocCartEvent {}

class CartInitialEvent extends BlocCartEvent {}

class CartRemoveFromCartEvent extends BlocCartEvent {
  final ProductDataModel productDataModel;
  CartRemoveFromCartEvent({required this.productDataModel});
}
