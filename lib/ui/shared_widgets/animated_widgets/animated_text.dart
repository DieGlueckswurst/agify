import 'package:agify/constants/palette.dart';
import 'package:flutter/material.dart';

const kDefaultTextAnimationDuration = Duration(
  milliseconds: 200,
);

class AnimatedText extends StatelessWidget {
  final String text;
  final bool isTapped;
  final Color color;
  final TextStyle style;
  final int maxLines;
  final TextOverflow overflow;
  final bool softWrap;
  final TextAlign textAlign;

  const AnimatedText({
    super.key,
    required this.text,
    required this.isTapped,
    required this.style,
    this.color = Palette.beige,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = false,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: kDefaultTextAnimationDuration,
      style: style.copyWith(
        color: color.withOpacity(
          isTapped ? 0.5 : 1,
        ),
      ),
      child: Text(
        text,
        textAlign: textAlign,
        softWrap: softWrap,
        overflow: overflow,
        maxLines: maxLines,
        textHeightBehavior: const TextHeightBehavior(
          applyHeightToFirstAscent: false,
        ),
      ),
    );
  }
}
