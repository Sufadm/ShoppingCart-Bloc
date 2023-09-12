import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/features/cart/ui/cart_page.dart';
import 'package:sample_bloc/features/home/bloc/bloc_home_bloc.dart';
import 'package:sample_bloc/features/home/ui/product_widget.dart';
import 'package:sample_bloc/features/wishlist/ui/wishlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homebloc.add(HomeInitialEvent());
    super.initState();
  }

  final BlocHomeBloc homebloc = BlocHomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlocHomeBloc, BlocHomeState>(
      bloc: homebloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigatingtToCartPagectionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ));
        } else if (state is HomeNavigatingtToWishListPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WishListPage(),
              ));
        } else if (state is HomeproductItemsWishlistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Whishlisted')));
        } else if (state is HomeproductItemsCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Carted')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case HomeLoadingSuccessState:
            final successrate = state as HomeLoadingSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                actions: [
                  IconButton(
                      onPressed: () {
                        homebloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homebloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.shopping_bag_outlined))
                ],
                title: const Center(
                    child: Text(
                  'Sufadzan Grocery App',
                )),
              ),
              body: ListView.builder(
                itemCount: successrate.products.length,
                itemBuilder: (context, index) {
                  return ListProductPage(
                      homeBloc: homebloc,
                      productDataModel: successrate.products[index]);
                },
              ),
            );

          case HomeError:
            return const Scaffold(
              body: Center(child: Text('ERROR')),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
