import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zindl_hub/core/time_formatter.dart';

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

  late Timer timeTicker;

  onStart() {
    timeTicker = Timer.periodic(
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

  _showCurrentTime(TimerEventState currentState) {
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeViewBloc, TimeViewState>(
      builder: (
        BuildContext context,
        TimeViewState currentState,
      ) {
        return Center(
          child: switch (currentState) {
            InTimeViewState() => null,
            ErrorTimeViewState() => null,
            UnTimeViewState() => null,
            TimerEventState() => _showCurrentTime(currentState),
          },
        );
      },
    );
  }
}

class InTimeViewState extends TimeViewState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class ErrorTimeViewState extends TimeViewState {
  final String errorMessage;

  ErrorTimeViewState(this.errorMessage);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class UnTimeViewState extends TimeViewState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class TimerEventState extends TimeViewState {
  final DateTime dateTime;

  TimerEventState(this.dateTime);

  @override
  List<Object?> get props => [dateTime];
}

sealed class TimeViewState extends Equatable {}
