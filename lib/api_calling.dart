// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/constant.dart';

class WeatherService {
  Future<Map<String, dynamic>?> getWeather(String cityName) async {
    String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$api_key';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to connect to the weather API');
    }
  }
}
