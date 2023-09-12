part of 'bloc_cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class BlocCartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;
  CartSuccessState({required this.cartItems});
}
