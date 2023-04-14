import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/data_bloc/datalist_bloc.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  bool isTap = false;
  String? imageUrl;
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
  void initState() {
    super.initState();
    Random random = Random();
    int index = random.nextInt(imageList.length);
    imageUrl = imageList[index]; // Initialize the image URL
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Fetch Data'),
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          onPressed: () {
            isTap = true;
            Random random = Random();
            int index = random.nextInt(imageList.length);
            setState(() {
              imageUrl = imageList[index];
            });
            setState(() {
              isTap = true;
            });
            Future.delayed(const Duration(seconds: 2), () {
              setState(() {
                isTap = false;
              });
            });
            context.read<DataBloc>().add(FetchData(imageList));
          },
          child: isTap
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : const Icon(
                  Icons.refresh_sharp,
                  size: 25,
                  color: Colors.white,
                ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: BlocBuilder<DataBloc, DataState>(
              builder: (context, state) {
                if (state is DataLoaded) {
                  return ScaleTransition(
                    scale: Tween<double>(begin: 0, end: 1).animate(
                      CurvedAnimation(
                        parent: context.read<DataBloc>().animationController,
                        curve: Curves.easeOut,
                      ),
                    ),
                    child: Image.asset(
                      imageUrl.toString(),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  );
                } else {
                  return Center(
                    child: isTap == true
                        ? const CircularProgressIndicator()
                        : const Text(
                            "No Fetch Data",
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
