import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sneak_crib/core/utils/const.dart';
import 'package:sneak_crib/core/utils/shared_prefrences.dart';
import 'package:sneak_crib/core/models/product.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  void addToCart(Product product) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection("cart")
        .doc(product.text)
        .set({
      'group': product.group,
      'url': product.url,
      'text': product.text,
      'price': product.price,
    }).then(
      (value) {
        emit(UserHomeSuccessState());
      },
    ).catchError(
      (error) {
        emit(UserHomeErrorState(error));
      },
    );
  }
}
