import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sample_bloc/data/cart_items.dart';
import 'package:sample_bloc/data/grocery_data.dart';
import 'package:sample_bloc/data/wishlist_items.dart';
import 'package:sample_bloc/features/home/models/home_products_model.dart';

part 'bloc_home_event.dart';
part 'bloc_home_state.dart';

class BlocHomeBloc extends Bloc<BlocHomeEvent, BlocHomeState> {
  BlocHomeBloc() : super(BlocHomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeproductWishlistButtonClickedEvent>(
        homeproductWishlistButtonClickedEvent);
    on<HomeproductCartButtonClickedEvent>(homeproductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<BlocHomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadingSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeproductWishlistButtonClickedEvent(
      HomeproductWishlistButtonClickedEvent event,
      Emitter<BlocHomeState> emit) {
    print('wishlist clicked');
    wishlistItems.add(event.clickedProduct);
    emit(HomeproductItemsWishlistedActionState());
  }

  FutureOr<void> homeproductCartButtonClickedEvent(
      HomeproductCartButtonClickedEvent event, Emitter<BlocHomeState> emit) {
    print('cart clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeproductItemsCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<BlocHomeState> emit) {
    print('wishlist navigate button clicked');
    emit(HomeNavigatingtToWishListPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<BlocHomeState> emit) {
    print('Cart navigate button clicked');
    emit(HomeNavigatingtToCartPagectionState());
  }
}
