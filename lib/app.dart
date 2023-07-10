import 'package:agify/constants/palette.dart';
import 'package:agify/gen/fonts.gen.dart';
import 'package:agify/shared_utils/color_service.dart';
import 'package:agify/views/home/home_view.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'agify',
      theme: ThemeData(
        fontFamily: FontFamily.roboto,
        primarySwatch: ColorService.createMaterialColor(
          Palette.black,
        ),
        scaffoldBackgroundColor: Palette.beige,
      ),
      home: const HomeView(),
    );
  }
}
