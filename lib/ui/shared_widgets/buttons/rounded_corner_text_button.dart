import 'package:agify/constants/decoration.dart';
import 'package:agify/constants/palette.dart';
import 'package:flutter/material.dart';

import '../../../constants/text_styles.dart';
import '../animated_widgets/animated_text.dart';
import '../animated_widgets/tappable_scale.dart';
import '../lottie_animations/loading_dots.dart';

class RoundedCornersTextButton extends StatefulWidget {
  final String title;

  final VoidCallback onTap;

  final bool isLoading;
  final double? width;
  final double? height;

  final bool isEnabled;

  const RoundedCornersTextButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.width,
    this.height = 55,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  State<RoundedCornersTextButton> createState() =>
      _RoundedCornersTextButtonState();
}

class _RoundedCornersTextButtonState extends State<RoundedCornersTextButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Palette.transparent,
      child: TappableScale(
        onTap: () {
          if (widget.isEnabled && !widget.isLoading) {
            widget.onTap();
          }
        },
        builder: (context, isTapped) {
          return AnimatedContainer(
            duration: kThemeAnimationDuration,
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              color: widget.isEnabled && !isTapped
                  ? Palette.darkBlue
                  : Palette.darkBlue.withOpacity(0.6),
            ),
            child: Center(
              child: widget.isLoading
                  ? const Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: LoadingDots(),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Material(
                                color: Palette.transparent,
                                child: AnimatedText(
                                  text: widget.title,
                                  color: widget.isEnabled && !isTapped
                                      ? Palette.beige
                                      : Palette.beige.withOpacity(0.7),
                                  isTapped: isTapped,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.robotoH6SemiBold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
