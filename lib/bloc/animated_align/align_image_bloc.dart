import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'align_image_event.dart';
part 'align_image_state.dart';

class AlignImageBloc extends Bloc<ImageEvent, ImageState> {
  AlignImageBloc() : super(ImageState(Alignment.center)) {
    on<ChangeAlignmentEvent>((event, emit) {
      emit(ImageState(event.alignment));
    });
  }
}
