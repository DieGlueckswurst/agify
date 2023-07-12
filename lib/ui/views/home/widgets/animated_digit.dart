import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';

import '../../../../constants/text_styles.dart';

class AnimatedDigit extends StatefulWidget {
  final int value;
  const AnimatedDigit({super.key, required this.value});

  @override
  State<AnimatedDigit> createState() => _AnimatedDigitState();
}

class _AnimatedDigitState extends State<AnimatedDigit> {
  @override
  Widget build(BuildContext context) {
    return AnimatedDigitWidget(
      value: widget.value,
      duration: const Duration(milliseconds: 2000),
      textStyle: AppTextStyles.recoletaH1Regular,
    );
  }
}
