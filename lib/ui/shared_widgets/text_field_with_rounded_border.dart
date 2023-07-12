import 'package:agify/constants/palette.dart';
import 'package:agify/shared_utils/dismiss_keyboard.dart';
import 'package:agify/shared_utils/wait.dart';
import 'package:agify/ui/shared_widgets/animated_widgets/tappable_scale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/text_styles.dart';
import '../../constants/transition_duration.dart';

class TextFieldWithRoundedBorder extends StatefulWidget {
  final String? hintText;
  final bool focusOnInit;
  final bool showClearButton;
  final Function(String) onChanged;
  final Function(String?)? onSubmit;

  const TextFieldWithRoundedBorder({
    Key? key,
    required this.hintText,
    required this.focusOnInit,
    required this.onChanged,
    required this.onSubmit,
    this.showClearButton = true,
  }) : super(key: key);

  @override
  State<TextFieldWithRoundedBorder> createState() =>
      _TextFieldWithRoundedBorderState();
}

class _TextFieldWithRoundedBorderState
    extends State<TextFieldWithRoundedBorder> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.focusOnInit) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) async {
          await wait(transitionDurationInMS);
          _focusNode.requestFocus();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (text) {
        dismissKeyboard();
        if (widget.onSubmit != null) {
          widget.onSubmit!(text);
        }
      },
      controller: _controller,
      textCapitalization: TextCapitalization.characters,
      inputFormatters: [
        // Disable white characters
        FilteringTextInputFormatter.deny(
          RegExp(
            '[ ]',
          ),
        )
      ],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(
          20,
        ),
        hintText: widget.hintText,
        enabledBorder: _border,
        focusedBorder: _border,
        border: _border,
        disabledBorder: _border,
        suffixIcon: widget.showClearButton && _controller.text.isNotEmpty
            ? TappableScale(onTap: () {
                _controller.text = '';
                widget.onChanged('');
              }, builder: (context, isTapped) {
                return const Icon(
                  CupertinoIcons.multiply_circle_fill,
                  color: Palette.black,
                );
              })
            : null,
      ),
      autocorrect: false,
      style: AppTextStyles.robotoH5SemiBold,
      textAlign: TextAlign.center,
      onChanged: widget.onChanged,
      focusNode: _focusNode,
    );
  }

  InputBorder get _border => OutlineInputBorder(
        borderSide: const BorderSide(
          color: Palette.brown,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      );
}
