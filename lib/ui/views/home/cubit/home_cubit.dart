import 'package:agify/data/backend/agify/agify_api.dart';
import 'package:agify/shared_utils/exeption_mappter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final AgifyApi _agifyApi;

  HomeCubit({required AgifyApi agifyApi})
      : _agifyApi = agifyApi,
        super(const HomeState.idle());

  Future<void> getAgeForName({
    required String name,
    required String? countryCode,
  }) async {
    try {
      emit(const HomeState.loading());

      final int age = await _agifyApi.getAgeFromName(
        name: 'Tom',
        countryCode: countryCode,
      );

      emit(HomeState.success(age: age));
    } catch (error, stackTrace) {
      emit(
        HomeState.error(
          message: ExceptionMapper.mapExceptionToMessage(error, stackTrace),
        ),
      );
    }
  }
}
