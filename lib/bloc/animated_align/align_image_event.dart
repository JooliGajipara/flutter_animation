part of 'align_image_bloc.dart';

abstract class ImageEvent {}

class ChangeAlignmentEvent extends ImageEvent {
  final Alignment alignment;

  ChangeAlignmentEvent(this.alignment);
}