import 'package:agify/gen/assets.gen.dart';
import 'package:agify/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '42',
              style: TextStyle(
                fontFamily: FontFamily.recoleta,
                fontSize: 42,
              ),
            ),
            LottieBuilder.asset(Assets.lottie.plasma),
          ],
        ),
      ),
    );
  }
}
