import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playground/data/user_repository.dart';
import 'package:flutter_playground/ui/base/base_bloc.dart';
import 'package:flutter_playground/ui/base/base_event.dart';
import 'package:flutter_playground/ui/base/base_state.dart';
import 'package:flutter_playground/ui/login/login_event.dart';
import 'package:flutter_playground/ui/login/login_state.dart';

export 'login_event.dart';
export 'login_state.dart';

class LoginBloc extends BaseBloc {
  final UserRepository userRepository;

  LoginBloc(this.userRepository);

  @override
  BaseState get initialState => Initial();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is LoginButtonPressed) {
      yield Loading();
      FirebaseUser user;
      try {
        user = await userRepository.login(event.email, event.password);
      } catch (exception) {
        yield Message((exception as PlatformException).message);
      } finally {
        if (user != null) {
          yield LoginSuccess();
        }
      }
    }
  }
}
