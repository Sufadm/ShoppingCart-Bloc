part of 'bloc_home_bloc.dart';

@immutable
abstract class BlocHomeEvent {}

class HomeInitialEvent extends BlocHomeEvent {}

class HomeproductWishlistButtonClickedEvent extends BlocHomeEvent {
  final ProductDataModel clickedProduct;

  HomeproductWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeproductCartButtonClickedEvent extends BlocHomeEvent {
  final ProductDataModel clickedProduct;

  HomeproductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeWishlistButtonNavigateEvent extends BlocHomeEvent {}

class HomeCartButtonNavigateEvent extends BlocHomeEvent {}
