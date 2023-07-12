import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../constants/palette.dart';
import '../../../../constants/text_styles.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/home_cubit.dart';

class AgeDisplay extends StatelessWidget {
  const AgeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            LottieBuilder.asset(
              Assets.lottie.plasma,
              animate: true,
              repeat: _getAnimate(state),
              height: 150,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  duration: kThemeAnimationDuration,
                  opacity: _getOpacity(state),
                  child: Text(
                    'Du bist',
                    style: AppTextStyles.robotoH5SemiBold.copyWith(
                      color: Palette.beige,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                AnimatedScale(
                  duration: kThemeAnimationDuration * 2,
                  scale: _getScale(state),
                  child: AnimatedOpacity(
                    duration: kThemeAnimationDuration,
                    opacity: _getOpacity(state),
                    child: AnimatedDigitWidget(
                      duration: const Duration(milliseconds: 2000),
                      value: _getAge(state),
                      textStyle: AppTextStyles.recoletaH1Regular,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                AnimatedOpacity(
                  duration: kThemeAnimationDuration,
                  opacity: _getOpacity(state),
                  child: Text(
                    'Jahre alt!',
                    style: AppTextStyles.robotoH5SemiBold.copyWith(
                      color: Palette.beige,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  int _getAge(HomeState state) {
    return state.maybeWhen(
      success: (age) {
        return age;
      },
      orElse: () {
        return 0;
      },
    );
  }

  bool _getAnimate(HomeState state) {
    return state.when(
      idle: () {
        return false;
      },
      loading: () {
        return true;
      },
      success: (age) {
        return false;
      },
      error: (message) {
        return false;
      },
    );
  }

  double _getScale(HomeState state) {
    return state.when(
      idle: () {
        return 0;
      },
      loading: () {
        return 0;
      },
      success: (age) {
        return 1;
      },
      error: (message) {
        return 0;
      },
    );
  }

  double _getOpacity(HomeState state) {
    return state.when(
      idle: () {
        return 0;
      },
      loading: () {
        return 0;
      },
      success: (age) {
        return 1;
      },
      error: (message) {
        return 0;
      },
    );
  }
}
