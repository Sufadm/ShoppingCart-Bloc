import 'package:flutter/material.dart';
import 'package:sample_bloc/features/cart/bloc/bloc_cart_bloc.dart';
import 'package:sample_bloc/features/home/models/home_products_model.dart';

class ListCartPage extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const ListCartPage(
      {super.key, required this.productDataModel, required this.cartBloc});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 190,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(productDataModel.description),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${productDataModel.price}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // cartBloc.add(HomeproductWishlistButtonClickedEvent(
                        //     clickedProduct: productDataModel));
                      },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        cartBloc.add(CartRemoveFromCartEvent(
                            productDataModel: productDataModel));
                      },
                      icon: const Icon(Icons.delete))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
