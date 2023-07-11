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
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            LottieBuilder.asset(
              Assets.lottie.plasma,
              animate: true,
              height: 150,
            ),
            Column(
              children: [
                Text(
                  'Du bist',
                  style: AppTextStyles.robotoH5SemiBold.copyWith(
                    color: Palette.beige,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  '42',
                  style: AppTextStyles.recoletaH1Regular,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Jahre alt!',
                  style: AppTextStyles.robotoH5SemiBold.copyWith(
                    color: Palette.beige,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
