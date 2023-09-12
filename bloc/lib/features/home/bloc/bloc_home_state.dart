part of 'bloc_home_bloc.dart';

@immutable
abstract class BlocHomeState {}

abstract class HomeActionState extends BlocHomeState {}

class BlocHomeInitial extends BlocHomeState {}

class HomeLoadingState extends BlocHomeState {}

class HomeLoadingSuccessState extends BlocHomeState {
  final List<ProductDataModel> products;

  HomeLoadingSuccessState({required this.products});
}

class HomeError extends BlocHomeState {}

class HomeNavigatingtToWishListPageActionState extends HomeActionState {}

class HomeNavigatingtToCartPagectionState extends HomeActionState {}

class HomeproductItemsWishlistedActionState extends HomeActionState {}

class HomeproductItemsCartedActionState extends HomeActionState {}
