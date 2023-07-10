import 'package:agify/constants/palette.dart';
import 'package:agify/shared_utils/wait.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/text_styles.dart';
import '../../constants/transition_duration.dart';

class TextFieldWithRoundedBorder extends StatefulWidget {
  final String? hintText;
  final bool focusOnInit;
  final Function(String) onChanged;
  final Function(String?)? onSubmit;

  const TextFieldWithRoundedBorder({
    Key? key,
    required this.hintText,
    required this.focusOnInit,
    required this.onChanged,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<TextFieldWithRoundedBorder> createState() =>
      _TextFieldWithRoundedBorderState();
}

class _TextFieldWithRoundedBorderState
    extends State<TextFieldWithRoundedBorder> {
  final FocusNode _focusNode = FocusNode();

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
      onFieldSubmitted: widget.onSubmit,
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
      ),
      autocorrect: false,
      style: AppTextStyles.robotoH5Regular,
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
