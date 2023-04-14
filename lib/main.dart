import 'package:flutter/material.dart';
import 'package:flutter_animation/screen/bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/animated_align/align_image_bloc.dart';
import 'bloc/animated_hero/hero_animated_bloc.dart';
import 'bloc/bottom_bar/bottom_bar_bloc.dart';
import 'bloc/data_bloc/datalist_bloc.dart';
import 'bloc/profile_picture/profile_update_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavBarBloc(),
        ),
        BlocProvider(
          create: (context) => HeroImageBloc(),
        ),
        BlocProvider(
          create: (context) => AlignImageBloc(),
        ),
        BlocProvider(
          create: (context) => DataBloc(tickerProvider: this),
        ),
        BlocProvider(
          create: (context) => ProfilePictureBloc(tickerProvider: this),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const CurvedNavigationBarWidget()),
    );
  }
}
