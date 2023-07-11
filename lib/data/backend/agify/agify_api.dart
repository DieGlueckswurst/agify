import 'package:agify/data/backend/api_base.dart/api_client.dart';

class AgifyApi {
  final ApiClient _apiClient;

  static const String baseUrl = 'https://api.agify.io';

  static const String fallbackCountryCode = 'de';

  AgifyApi({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  Future<int> getAgeFromName({
    required String name,
    required String? countryCode,
  }) async {
    final response = await _apiClient.get(
      endpoint: baseUrl,
      queryParameters: {
        'name': name,
        // Responses will in a lot of cases be more accurate if the data is narrowed to a specific country.
        // See: https://agify.io/#localization
        'country_id': countryCode ?? fallbackCountryCode,
      },
    );

    int? age = int.tryParse(response['age'].toString());

    if (age == null) {
      throw Exception(
        'Für diesen Namen konnte kein Alter herausgefunden werden...',
      );
    }

    return age;
  }
}
