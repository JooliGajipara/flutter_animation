// ignore_for_file: prefer_typing_uninitialized_variables

part of 'hero_animated_bloc.dart';

abstract class HeroAnimateEvent {}

class HeroLoadImage extends HeroAnimateEvent{
  final imageUrl;

  HeroLoadImage(this.imageUrl);
}
