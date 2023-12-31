import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user_model.dart';
import '../reusable_widgets.dart';
import '../screens/home_screen.dart';
import '../states/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(LoginSuccessState(userCredential.user!.uid));
      print(userCredential.user!.email);
      print(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'حدث خطأ ما';
      if (e.code == 'user-not-found') {
        emit(LoginErrorState(error:'لم يتم العثور على مستخدم بهذا البريد الإلكتروني.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginErrorState(error: 'كلمه السر خطأ'));
      }else if(e.code == 'invalid-email') {
        emit(LoginErrorState(error: 'البريد الإلكتروني غير صالح'))  ;
      }else{
        emit(LoginErrorState(error:errorMessage));

      }

      print(e.toString());
    } catch (e) {
      emit(LoginErrorState(error: 'حدث خطأ ما',  ));
      print(e.toString());
    }
  }

  googleLogin(context){
    emit(GoogleLoginLoadingState());
    GoogleSignIn().signIn().then((value){
      value!.authentication.then((googleKey){
        FirebaseAuth.instance.signInWithCredential(GoogleAuthProvider.credential(
          idToken: googleKey.idToken,
          accessToken: googleKey.accessToken,
        )).then((value){
          FirebaseFirestore.instance.collection('users').doc(value.user!.uid).get().then((ex){
            if(ex.exists){
              navigateAndFinish(context: context, screen: const HomeScreen());
            }else{
              createUser(
                email: value.user!.email!,
                name: value.user!.displayName!,
                id: value.user!.uid,
                context: context,
              );
            }
          });
          emit(GoogleLoginSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(GoogleLoginErrorState());
        });
      }).catchError((error){
        print(error.toString());
        emit(GoogleLoginErrorState());
      });
    }).catchError((error){
      print(error.toString());
      emit(GoogleLoginErrorState());
    });
  }

  createUser({
    required String email,
    required String name,
    required String id,
    context
  }){
    emit(CreateUserLoadingState());
    UserModel model=UserModel(
      email: email,
      name: name,
      uId: id,
    );
    FirebaseFirestore.instance.collection('users').doc(id).set(model.toMap()).then((value){
      navigateAndFinish(context: context, screen: const HomeScreen());
      emit(CreateUserSuccessState());
    }).catchError((error){
      emit(CreateUserErrorState());
    });
  }
}