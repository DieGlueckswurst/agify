import 'package:agify/constants/palette.dart';
import 'package:agify/data/backend/agify/agify_api.dart';
import 'package:agify/gen/fonts.gen.dart';
import 'package:agify/shared_utils/color_service.dart';
import 'package:agify/ui/views/home/cubit/home_cubit.dart';
import 'package:agify/ui/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final AgifyApi agifyApi;
  const App({
    required this.agifyApi,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeCubit(
            agifyApi: agifyApi,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'agify',
        theme: ThemeData(
          fontFamily: FontFamily.roboto,
          primarySwatch: ColorService.createMaterialColor(
            Palette.black,
          ),
          scaffoldBackgroundColor: Palette.brown,
        ),
        home: const HomeView(),
      ),
    );
  }
}
