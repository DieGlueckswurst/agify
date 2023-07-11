part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.idle() = _Idle;

  const factory HomeState.loading() = _Loading;

  const factory HomeState.success({
    required int age,
  }) = _Success;

  const factory HomeState.error({required String message}) = _Error;
}
