part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class UserCartLoadingState extends CartState {}

class UserCartSuccessState extends CartState {}

class UserCartErrorState extends CartState {
  UserCartErrorState(String error);
}

class UserCartRemoveLoadingState extends CartState {}

class UserCartRemoveSuccessState extends CartState {}

class UserCartRemoveErrorState extends CartState {
  UserCartRemoveErrorState(String error);
}
