import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/place.dart';
import '../models/place_details.dart';

class OpenTripMapService {
  static const String _baseUrl = 'https://api.opentripmap.com/0.1/en/places';
  static const String _apiKey = '5ae2e3f221c38a28845f05b6249b8e4b32672a39d33fcd6bc75037f0';

  /// Fetch accommodations within a radius
  Future<List<Place>> fetchAccommodations({
    double lat = 35.7595,
    double lon = -5.8339,
    int radius = 5000,
    String kinds = 'accomodations',
  }) async {
    try {
      final url = Uri.parse(
        '$_baseUrl/radius?radius=$radius&lat=$lat&lon=$lon&kinds=$kinds&apikey=$_apiKey',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Place.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load accommodations: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching accommodations: $e');
    }
  }

  /// Fetch detailed information about a specific place
  Future<PlaceDetails> fetchPlaceDetails(String xid) async {
    try {
      final url = Uri.parse('$_baseUrl/xid/$xid?apikey=$_apiKey');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return PlaceDetails.fromJson(data);
      } else {
        throw Exception('Failed to load place details: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching place details: $e');
    }
  }
}
