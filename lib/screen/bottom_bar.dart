import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/screen/data_screen.dart';
import 'package:flutter_animation/screen/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bottom_bar/bottom_bar_bloc.dart';
import 'align_image_screen.dart';
import 'hero_image_screen.dart';

class CurvedNavigationBarWidget extends StatefulWidget {
  const CurvedNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<CurvedNavigationBarWidget> createState() =>
      _CurvedNavigationBarWidgetState();
}

class _CurvedNavigationBarWidgetState extends State<CurvedNavigationBarWidget> {
  final BottomNavBarBloc _bottomNavBarBloc = BottomNavBarBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarBloc, int>(
      bloc: _bottomNavBarBloc,
      builder: (context, currentIndex) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: _buildScreen(currentIndex),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            index: currentIndex,
            animationCurve: Curves.easeInOut,
            backgroundColor: Colors.transparent,
            color: Colors.pinkAccent,
            buttonBackgroundColor: Colors.pink,
            height: 60,
            items: const <Widget>[
              Icon(Icons.home, size: 30, color: Colors.white),
              Icon(Icons.format_align_center, size: 30, color: Colors.white),
              Icon(Icons.image, size: 30, color: Colors.white),
              Icon(Icons.settings, size: 30, color: Colors.white),
            ],
            onTap: (index) {
              _bottomNavBarBloc.add(index);
            },
          ),
        );
      },
    );
  }

  Widget _buildScreen(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const AlignImageScreen();
      case 2:
        return const DataScreen();
      case 3:
        return const ProfileScreen();
      default:
        return Container();
    }
  }
}
