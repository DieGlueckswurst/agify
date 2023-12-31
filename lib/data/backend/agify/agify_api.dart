import 'package:agify/data/backend/api_base.dart/api_client.dart';
import 'package:agify/data/backend/api_base.dart/api_exeption.dart';

class AgifyApi {
  final ApiClient _apiClient;

  static const String _baseUrl = 'https://api.agify.io';

  static const String _fallbackCountryCode = 'de';

  AgifyApi({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  Future<int> getAgeFromName({
    required String name,
    required String? countryCode,
  }) async {
    final response = await _apiClient.get(
      endpoint: _baseUrl,
      queryParameters: {
        'name': name,
        // Responses will in a lot of cases be more accurate if the data is narrowed to a specific country.
        // See: https://agify.io/#localization
        'country_id': countryCode ?? _fallbackCountryCode,
      },
    );

    int? age = int.tryParse(response['age'].toString());

    if (age == null) {
      throw ApiException(
        cause: ApiExceptionCause.notFound,
      );
    }

    return age;
  }
}
