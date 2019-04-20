// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/data/user_repository.dart';
import 'package:flutter_playground/ui/login/login_bloc.dart';
import 'package:flutter_playground/ui/login/login_screen.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    super.onError(error, stacktrace);
    print(error);
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserRepository _userRepository;
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _userRepository = UserRepository(FirebaseAuth.instance);
    _loginBloc = LoginBloc(_userRepository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<LoginBloc>(bloc: _loginBloc),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: LoginScreen(),
      ),
    );
  }
}
