import 'package:agify/constants/palette.dart';
import 'package:agify/ui/shared_widgets/buttons/rounded_corner_text_button.dart';
import 'package:agify/ui/shared_widgets/text_field_with_rounded_border.dart';
import 'package:agify/ui/views/home/cubit/home_cubit.dart';
import 'package:agify/ui/views/home/widgets/age_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          const Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AgeDisplay(),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Palette.beige,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextFieldWithRoundedBorder(
                      hintText: 'Wie heißt du?',
                      focusOnInit: true,
                      onChanged: (name) {},
                      onSubmit: (name) {
                        _getAge(name: '', countryCode: '');
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: RoundedCornersTextButton(
                      width: 200,
                      title: 'Bestätigen',
                      isEnabled: true,
                      onTap: () async {
                        _getAge(name: '', countryCode: '');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _getAge({
    required String name,
    required String? countryCode,
  }) {
    final courseCubit = BlocProvider.of<HomeCubit>(context);
    courseCubit.getAgeForName(name: '', countryCode: '');
  }
}
