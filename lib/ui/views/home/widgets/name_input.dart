import 'package:agify/ui/views/home/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared_widgets/buttons/rounded_corner_text_button.dart';
import '../../../shared_widgets/text_field_with_rounded_border.dart';
import '../cubit/home_cubit.dart';

class NameInput extends StatefulWidget {
  const NameInput({
    super.key,
  });

  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  String _name = '';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: kThemeAnimationDuration,
          layoutBuilder: (currentChild, previousChildren) {
            return Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                ...previousChildren,
                if (currentChild != null) currentChild,
              ],
            );
          },
          child: state.maybeWhen(error: (message) {
            return ErrorView(
              key: const Key('error'),
              message: message,
            );
          }, orElse: () {
            return Column(
              key: const Key('no_error'),
              children: [
                SizedBox(
                  width: 300,
                  child: TextFieldWithRoundedBorder(
                    hintText: 'Wie heißt du?',
                    focusOnInit: true,
                    onChanged: (name) {
                      _name = name;
                      final courseCubit = BlocProvider.of<HomeCubit>(context);
                      courseCubit.reset();
                    },
                    onSubmit: (name) {
                      _getAge(
                        name: _name,
                        countryCode:
                            Localizations.localeOf(context).countryCode,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                RoundedCornersTextButton(
                  width: 200,
                  title: 'Bestätigen',
                  isEnabled: true,
                  isLoading: state == const HomeState.loading(),
                  onTap: () async {
                    _getAge(
                      name: _name,
                      countryCode: Localizations.localeOf(context).countryCode,
                    );
                  },
                ),
              ],
            );
          }),
        );
      },
    );
  }

  void _getAge({
    required String name,
    required String? countryCode,
  }) {
    final courseCubit = BlocProvider.of<HomeCubit>(context);
    courseCubit.getAgeForName(
      name: name,
      countryCode: countryCode,
    );
  }
}
