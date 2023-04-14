import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'datalist_event.dart';

part 'datalist_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final TickerProvider tickerProvider;
  late AnimationController animationController;

  DataBloc({required this.tickerProvider}) : super(DataInitial()) {
    animationController = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(milliseconds: 500),
    );
    on<FetchData>((event, emit) async {
      emit(DataLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(DataLoaded(event.data));
    });
  }

  @override
  void onTransition(Transition<DataEvent, DataState> transition) {
    super.onTransition(transition);
    animationController.reset();
    animationController.forward();
  }

  @override
  Future<void> close() {
    animationController.dispose();
    return super.close();
  }
}
