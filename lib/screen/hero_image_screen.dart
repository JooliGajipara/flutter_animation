import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/animated_hero/hero_animated_bloc.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key, required this.imageUrl, required this.tag})
      : super(key: key);
  final String imageUrl;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HeroImageBloc>(
        create: (BuildContext context) =>
            HeroImageBloc()..add(HeroLoadImage(imageUrl)),
        child: BlocBuilder<HeroImageBloc, HeroAnimateState>(
          builder: (BuildContext context, HeroAnimateState state) {
            if (state is HeroImageLoaded) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Hero(
                  tag: tag,
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageList = [
    'assets/images/img1.jpeg',
    'assets/images/img2.jpeg',
    'assets/images/img3.jpeg',
    'assets/images/img4.jpeg',
    'assets/images/img5.jpeg',
    'assets/images/img6.jpeg',
    'assets/images/img7.jpeg',
    'assets/images/img8.jpeg',
    'assets/images/img9.jpeg',
    'assets/images/img10.jpeg',
    'assets/images/img11.jpeg',
    'assets/images/img12.jpeg',
    'assets/images/img13.jpeg',
    'assets/images/img14.jpeg',
    'assets/images/img15.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Hero Animated Image",
          ),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),
        body: GridView.builder(
          itemCount: imageList.length,
          padding: const EdgeInsets.all(5),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ImageScreen(
                      imageUrl: imageList[index],
                      tag: 'img ${index + 1}',
                    ),
                  ),
                );
              },
              child: Hero(
                tag: 'img ${index + 1}',
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    color: Colors.black,
                    child: Image.asset(
                      imageList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
