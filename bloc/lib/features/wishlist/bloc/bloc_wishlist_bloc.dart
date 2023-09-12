import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_wishlist_event.dart';
part 'bloc_wishlist_state.dart';

class BlocWishlistBloc extends Bloc<BlocWishlistEvent, BlocWishlistState> {
  BlocWishlistBloc() : super(BlocWishlistInitial()) {
    on<BlocWishlistEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
