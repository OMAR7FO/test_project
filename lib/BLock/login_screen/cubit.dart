import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_project/BLock/login_screen/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool isChecked = false;
  bool isVisible = true;
  void changeCheck(bool value) {
    isChecked = value;
    emit(LoginCheckedState());
  }

  void changeVisibility() {
    isVisible = !isVisible;
    emit(LoginVisibilityState());
  }
}
