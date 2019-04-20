import 'package:flutter_playground/ui/base/base_state.dart';

class LoginSuccess extends BaseState {}

class LoginFailure extends BaseState {
  final String error;

  LoginFailure(this.error) : super([error]);
}
