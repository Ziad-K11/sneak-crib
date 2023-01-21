import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneak_crib/core/utils/shared_preferences.dart';
import 'package:sneak_crib/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({required email, required password}) {
    emit(UserLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      CacheHelper.saveData(key: 'uId', value: value.user!.uid);
      emit(UserLoginSuccessState());
    }).catchError(
      (error) {
        emit(UserLoginErrorState(error));
      },
    );
  }
}
