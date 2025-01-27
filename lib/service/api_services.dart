import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpApiService {
  // Singleton instance
  static final HttpApiService _instance = HttpApiService._internal();
  factory HttpApiService() => _instance;

  // Internal constructor
  HttpApiService._internal();

  Future<dynamic> get({required String endpoint}) async {
    try {
      final response = await http.get(Uri.parse(endpoint));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}