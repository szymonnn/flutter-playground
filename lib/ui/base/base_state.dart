import 'package:equatable/equatable.dart';

class BaseState extends Equatable {
  BaseState([List props = const []]) : super(props);

  @override
  String toString() {
    return "${this.runtimeType.toString()}";
  }
}

class Initial extends BaseState {}

class Loading extends BaseState {}

class Message extends BaseState {
  final String message;

  Message(this.message) : super([message]);
}
