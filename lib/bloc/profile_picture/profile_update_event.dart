part of 'profile_update_bloc.dart';

abstract class ProfilePictureEvent {}

class ProfilePictureUpdated extends ProfilePictureEvent {
  final String profilePicture;

  ProfilePictureUpdated(this.profilePicture);
}

class ProfilePictureSaved extends ProfilePictureEvent {
  final String profilePicture;

  ProfilePictureSaved(this.profilePicture);
}
