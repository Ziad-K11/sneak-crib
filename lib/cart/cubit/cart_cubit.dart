import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sneak_crib/core/utils/const.dart';
import 'package:sneak_crib/core/models/product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  List<Product> products = [];

  final _fireStore = FirebaseFirestore.instance;

  Future<void> getCart() async {
    emit(UserCartLoadingState());
    CollectionReference collectionReference =
        _fireStore.collection('users').doc(uId).collection('cart');
    QuerySnapshot querySnapshot = await collectionReference.get();
    products =
        querySnapshot.docs.map((e) => Product.fromJson(e.data())).toList();
    emit(UserCartSuccessState());
  }

  void removeFromCart({required String text}) {
    emit(UserCartRemoveLoadingState());
    DocumentReference _doc = FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('cart')
        .doc(text);
    _doc.delete().then((value) => {emit(UserCartRemoveSuccessState())});
  }
}
