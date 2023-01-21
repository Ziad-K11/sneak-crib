part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class UserHomeLoadingState extends HomeState {}

class UserHomeSuccessState extends HomeState {}

class UserHomeErrorState extends HomeState {
  UserHomeErrorState(String error);
}
