import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarBloc extends Bloc<int, int> {
  BottomNavBarBloc() : super(0) {
    on<int>((event, emit) {
      emit(event);
    });
  }
}
