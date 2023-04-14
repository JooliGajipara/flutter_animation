

import 'package:flutter_bloc/flutter_bloc.dart';

part 'hero_animated_event.dart';

part 'hero_animated_state.dart';

class HeroImageBloc extends Bloc<HeroAnimateEvent, HeroAnimateState> {
  HeroImageBloc() : super(HeroImageInitial()) {
    on<HeroLoadImage>((event, emit) {
      emit(HeroImageLoaded(imageUrl: event.imageUrl));
    });
  }
}
