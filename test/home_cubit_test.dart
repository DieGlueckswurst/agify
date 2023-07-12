import 'package:agify/data/backend/agify/agify_api.dart';
import 'package:agify/data/backend/api_base.dart/api_exeption.dart';
import 'package:agify/ui/views/home/cubit/home_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAgifyApi extends Mock implements AgifyApi {}

void main() {
  final api = _MockAgifyApi();

  /// Test success
  when(
    () => api.getAgeFromName(
      name: 'Chris',
      countryCode: any(named: "countryCode"),
    ),
  ).thenAnswer((_) async => 24);

  blocTest(
    "Emits correct states for success",
    build: () => HomeCubit(agifyApi: api),
    act: (cubit) => cubit.getAgeForName(name: "Chris", countryCode: "De"),
    expect: () => [
      const HomeState.loading(),
      const HomeState.success(age: 24),
    ],
  );

  /// Test error
  when(
    () => api.getAgeFromName(
      name: '',
      countryCode: '',
    ),
  ).thenThrow(
    (_) async => throw ApiException(
      cause: ApiExceptionCause.notFound,
      body: 'Etwas ist schief gelaufen!',
    ),
  );

  blocTest(
    'Emits error for empty name',
    build: () => HomeCubit(agifyApi: api),
    act: (cubit) => cubit.getAgeForName(name: '', countryCode: 'De'),
    expect: () => [
      const HomeState.loading(),
      const HomeState.error(
        message: 'Etwas ist schief gelaufen!',
      ),
    ],
  );
}
