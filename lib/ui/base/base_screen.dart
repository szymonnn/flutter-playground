import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/ui/base/base_event.dart';
import 'package:flutter_playground/ui/base/base_state.dart';

class BaseScreen extends StatelessWidget {
  final Bloc<BaseEvent, BaseState> bloc;
  final BlocWidgetBuilder<BaseState> builder;
  final BlocWidgetListener<BaseState> listener;
  final bool useDefaultListener;

  const BaseScreen(
      {Key key,
      @required this.bloc,
      @required this.builder,
      this.listener,
      this.useDefaultListener = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<BaseEvent, BaseState>(
      bloc: bloc,
      listener: (context, state) {
        if (useDefaultListener) {
          if (state is Message) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 2),
                content: Text(state.message),
              ),
            );
          }
        }

        if (listener != null) {
          listener.call(context, state);
        }
      },
      child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is Loading) {
              return Container(
                alignment: AlignmentDirectional.center,
                child: CircularProgressIndicator(),
              );
            }

            return builder.call(context, state);
          }),
    );
  }
}
