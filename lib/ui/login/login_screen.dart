import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/ui/base/base_screen.dart';
import 'package:flutter_playground/ui/login/login_bloc.dart';
import 'package:flutter_playground/ui/main/main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc loginBloc;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BaseScreen(
          bloc: loginBloc,
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MainScreen()));
            }
          },
          builder: (context, state) => Form(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Password"),
                        obscureText: true,
                        controller: _passwordController,
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            child: RaisedButton(
                              onPressed: _onLoginButtonPressed,
                              child: Text("Login"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }

  _onLoginButtonPressed() {
    loginBloc.dispatch(LoginButtonPressed(
        email: _emailController.text, password: _passwordController.text));
  }
}
