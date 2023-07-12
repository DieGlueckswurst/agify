import 'package:agify/constants/text_styles.dart';
import 'package:agify/ui/shared_widgets/buttons/rounded_corner_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/palette.dart';
import '../cubit/home_cubit.dart';

class ErrorView extends StatelessWidget {
  final String message;
  const ErrorView({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          const Icon(
            CupertinoIcons.exclamationmark_triangle_fill,
            color: Palette.black,
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            message,
            style: AppTextStyles.robotoH5Regular,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 32,
          ),
          RoundedCornersTextButton(
            width: 200,
            title: 'Erneut versuchen',
            onTap: () {
              final courseCubit = BlocProvider.of<HomeCubit>(context);
              courseCubit.reset();
            },
          ),
        ],
      ),
    );
  }
}
