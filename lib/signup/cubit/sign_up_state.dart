part of 'sign_up_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class UserRegisterLoadingState extends SignUpState {}

class UserRegisterSuccessState extends SignUpState {}

class UserRegisterErrorState extends SignUpState {
  UserRegisterErrorState(String error);
}

class UserCreateLoadingState extends SignUpState {}

class UserCreateSuccessState extends SignUpState {}

class UserCreateErrorState extends SignUpState {
  UserCreateErrorState(String error);
}
