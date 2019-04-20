import 'package:equatable/equatable.dart';

class BaseEvent extends Equatable {
  BaseEvent([List props = const []]) : super(props);

  @override
  String toString() {
    return "${this.runtimeType.toString()}";
  }
}
