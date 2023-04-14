// ignore_for_file: unnecessary_type_check

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_update_event.dart';

part 'profile_update_state.dart';

class ProfilePictureBloc
    extends Bloc<ProfilePictureEvent, ProfilePictureState> {
  final TickerProvider tickerProvider;
  late AnimationController animationController;

  ProfilePictureBloc({required this.tickerProvider})
      : super(ProfilePictureInitial()) {
    animationController = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(milliseconds: 500),
    );
    on<ProfilePictureUpdated>((event, emit) async {
      emit(ProfileLoading());
      await Future.delayed(const Duration(seconds: 2));
      if (event is ProfilePictureUpdated) {
        emit(ProfilePictureLoaded(event.profilePicture));
      } else if (event is ProfilePictureSaved) {
        emit(ProfilePictureLoaded(event.profilePicture));
      }
    });
  }

  @override
  void onTransition(
      Transition<ProfilePictureEvent, ProfilePictureState> transition) {
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
