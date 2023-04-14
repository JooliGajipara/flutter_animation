part of 'profile_update_bloc.dart';

abstract class ProfilePictureState {}

class ProfilePictureInitial extends ProfilePictureState {}

class ProfileLoading extends ProfilePictureState {}

class ProfilePictureLoaded extends ProfilePictureState {
  final String profilePicture;

  ProfilePictureLoaded(this.profilePicture);
}
