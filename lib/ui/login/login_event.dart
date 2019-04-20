import 'package:flutter_playground/ui/base/base_event.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends BaseEvent {
  LoginEvent([List props = const []]) : super(props);
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({
    @required this.email,
    @required this.password,
  }) : super([email, password]);
}
