import 'package:alex_uni_app/states/register_states.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user_model.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool obsecurePassword = true;
  void changePasswordVisibility(){
    obsecurePassword = !obsecurePassword;
    emit(RegisterChangePasswordVisibilityState());
  }

  UserModel user = UserModel();

  void userRegister({
    required String name,
    required String email,
    required String password,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      emit(RegisterSuccessState(value.user!.uid));
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(
        name: name,
        email: email,
        uId: value.user!.uid,
      );
    }).catchError((e) {
      emit(RegisterErrorState(e.toString()));
      print(e.toString());
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String uId,
  }) {
    emit(CreateUserLoadingState());
    user = UserModel(
      name: name,
      uId: uId,
      email: email,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(user.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((onError) {
      emit(CreateUserErrorState());
      print(onError.toString());
    });
  }

  int selectedRadioValue = 1;
  void changeRadioValue(int value) {
    selectedRadioValue = value;
    emit(RegisterChangeRadioValueState());
  }

  bool showEmailField = true;
  void changeEmailFieldState(bool value) {
    showEmailField = value;
    emit(RegisterChangeRadioValueState());
  }
}