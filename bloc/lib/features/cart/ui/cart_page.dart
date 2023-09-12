import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/features/cart/bloc/bloc_cart_bloc.dart';
import 'package:sample_bloc/features/cart/ui/cart_tile_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  final CartBloc cartBloc = CartBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart page'),
        ),
        body: BlocConsumer<CartBloc, CartState>(
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          bloc: cartBloc,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case CartSuccessState:
                final sucessState = state as CartSuccessState;
                return Scaffold(
                  body: ListView.builder(
                    itemCount: sucessState.cartItems.length,
                    itemBuilder: (context, index) {
                      return ListCartPage(
                        productDataModel: sucessState.cartItems[index],
                        cartBloc: cartBloc,
                      );
                    },
                  ),
                );

              default:
                return const SizedBox();
            }
          },
        ));
  }
}
