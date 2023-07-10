import 'package:agify/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDots extends StatelessWidget {
  const LoadingDots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Lottie.asset(
        Assets.lottie.loadingDots,
        animate: true,
        repeat: true,
      ),
    );
  }
}
