abstract class LoginStates{}

class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final String uId;
  LoginSuccessState(this.uId);
}
class LoginErrorState extends LoginStates{
  String error;
  LoginErrorState({required this.error});
}

class GoogleLoginLoadingState extends LoginStates{}

class GoogleLoginSuccessState extends LoginStates{}

class GoogleLoginErrorState extends LoginStates{}

class CreateUserLoadingState extends LoginStates{}

class CreateUserSuccessState extends LoginStates{}

class CreateUserErrorState extends LoginStates{}