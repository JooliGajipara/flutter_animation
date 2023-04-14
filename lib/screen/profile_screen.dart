// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../bloc/profile_picture/profile_update_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _profilePicture;
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Profile'),
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
        ),
        body: BlocBuilder<ProfilePictureBloc, ProfilePictureState>(
          builder: (context, state) {
            if (state is ProfilePictureLoaded) {
              return ScaleTransition(
                scale: Tween<double>(begin: 0, end: 1).animate(
                  CurvedAnimation(
                    parent:
                        context.read<ProfilePictureBloc>().animationController,
                    curve: Curves.easeOut,
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Colors.pink.withOpacity(0.5),
                          Colors.red.withOpacity(0.5)
                        ]),
                        border: Border.all(
                            color: _profilePicture != null
                                ? Colors.pink
                                : Colors.black,
                            width: 5)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: _profilePicture != null
                          ? Image.file(
                              File(_profilePicture.toString()),
                              fit: BoxFit.cover,
                            )
                          : const Center(
                              child: Text(
                                "No Image Selected",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: isTap == true
                    ? const CircularProgressIndicator()
                    : const Text(
                  "No Image Selected",
                  style: TextStyle(
                      color: Colors.black, fontSize: 25),
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          onPressed: () async {
            isTap = true;
            final pickedFile =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            if (pickedFile != null) {
              setState(() {
                _profilePicture = pickedFile.path;
              });
              context
                  .read<ProfilePictureBloc>()
                  .add(ProfilePictureUpdated(_profilePicture!));
            }
          },
          child: const Icon(Icons.add_a_photo),
        ),
      ),
    );
  }
}
