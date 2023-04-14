import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/animated_align/align_image_bloc.dart';

class AlignImageScreen extends StatelessWidget {
  final String imgUrl =
      'https://images.pexels.com/photos/11906612/pexels-photo-11906612.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load';

  const AlignImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Image Align'),
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
        ),
        body: BlocBuilder<AlignImageBloc, ImageState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: AnimatedAlign(
                    alignment: state.alignment,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          imgUrl,
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            tapButton(
                                onPress: () => context
                                    .read<AlignImageBloc>()
                                    .add(ChangeAlignmentEvent(
                                        Alignment.topLeft)),
                                title: 'Top Left'),
                            tapButton(
                                onPress: () => context
                                    .read<AlignImageBloc>()
                                    .add(ChangeAlignmentEvent(
                                        Alignment.topRight)),
                                title: 'Top Right'),
                          ],
                        ),
                        tapButton(
                            onPress: () => context
                                .read<AlignImageBloc>()
                                .add(ChangeAlignmentEvent(Alignment.center)),
                            title: 'Center'),
                        Column(
                          children: [
                            tapButton(
                                onPress: () => context
                                    .read<AlignImageBloc>()
                                    .add(ChangeAlignmentEvent(
                                        Alignment.bottomLeft)),
                                title: 'Bottom Left'),
                            tapButton(
                                onPress: () => context
                                    .read<AlignImageBloc>()
                                    .add(ChangeAlignmentEvent(
                                        Alignment.bottomRight)),
                                title: 'Bottom Right'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget tapButton({required Function() onPress, required String title}) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(primary: Colors.pinkAccent),
      child: Text(title),
    );
  }
}
