abstract class LoginState {}

class LoginInitial extends LoginState {}

class UserLoginLoadingState extends LoginState {}

class UserLoginSuccessState extends LoginState {}

class UserLoginErrorState extends LoginState {
  UserLoginErrorState(error);
}
