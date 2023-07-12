import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../constants/palette.dart';
import '../../../../constants/text_styles.dart';
import '../../../../gen/assets.gen.dart';
import '../cubit/home_cubit.dart';

class AgeDisplay extends StatefulWidget {
  const AgeDisplay({super.key});

  @override
  State<AgeDisplay> createState() => _AgeDisplayState();
}

class _AgeDisplayState extends State<AgeDisplay> {
  int _currentAge = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
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
                    child: Text(
                      _getAge(state).toString(),
                      style: AppTextStyles.recoletaH1Regular,
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

  _getAge(HomeState state) {
    return state.maybeWhen(
      success: (age) {
        _currentAge = age;
        return age;
      },
      orElse: () {
        return _currentAge;
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
