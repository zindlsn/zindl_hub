import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zindl_hub/services/time_formatter.dart';

class TimeViewScreenProvider extends StatelessWidget {
  const TimeViewScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimeViewBloc>(
      create: (context) => TimeViewBloc(InTimeViewState())..onStart(),
      child: const TimeViewScreen(),
    );
  }
}

class TimeViewScreen extends StatefulWidget {
  const TimeViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  TimeViewScreenState createState() {
    return TimeViewScreenState();
  }
}

class TimeViewBloc extends Cubit<TimeViewState> {
  TimeViewBloc(super.initialState);

  late Timer t1;

  onStart() {
    t1 = Timer.periodic(
        const Duration(seconds: 1), (timer) => _timerTick(timer));
  }

  _timerTick(Timer timer) {
    emit(TimerEventState(DateTime.now()));
  }
}

class TimeViewScreenState extends State<TimeViewScreen> {
  TimeViewScreenState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeViewBloc, TimeViewState>(builder: (
      BuildContext context,
      TimeViewState currentState,
    ) {
      if (currentState is UnTimeViewState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (currentState is ErrorTimeViewState) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(currentState.errorMessage),
          ],
        ));
      } else if (currentState is TimerEventState) {
        return Container(
          width: 400,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueAccent,
            ),
            color: Colors.blueAccent,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              const Text(
                'Stuttgart',
                style: TextStyle(color: Colors.white),
              ),
              Text(currentState.dateTime.format()),
            ],
          ),
        );
      }
      if (currentState is InTimeViewState) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

class InTimeViewState extends TimeViewState {}

class ErrorTimeViewState extends TimeViewState {
  String errorMessage;

  ErrorTimeViewState(this.errorMessage);
}

class UnTimeViewState extends TimeViewState {}

class TimerEventState extends TimeViewState {
  DateTime dateTime;

  TimerEventState(this.dateTime);
}

class TimeViewState {}
