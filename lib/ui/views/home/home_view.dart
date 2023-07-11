import 'package:agify/constants/palette.dart';
import 'package:agify/constants/text_styles.dart';
import 'package:agify/data/backend/agify/agify_api.dart';
import 'package:agify/data/backend/api_base.dart/api_client.dart';
import 'package:agify/gen/assets.gen.dart';
import 'package:agify/ui/shared_widgets/buttons/rounded_corner_text_button.dart';
import 'package:agify/ui/shared_widgets/text_field_with_rounded_border.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
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
                ),
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
                      onSubmit: (name) {},
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
                        int age = await AgifyApi(
                          apiClient: ApiClient(client: Dio()),
                        ).getAgeFromName(
                          name: 'Tom',
                          countryCode:
                              Localizations.localeOf(context).countryCode,
                        );
                        print(age);
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
}
