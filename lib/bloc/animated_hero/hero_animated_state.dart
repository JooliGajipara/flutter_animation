part of 'hero_animated_bloc.dart';

abstract class HeroAnimateState {}

class HeroImageInitial extends HeroAnimateState {}

class HeroImageLoaded extends HeroAnimateState{
  final String imageUrl;
  HeroImageLoaded({required this.imageUrl});
}