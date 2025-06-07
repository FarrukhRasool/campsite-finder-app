import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/campsite.dart';

class CampsiteService {
  static const String baseUrl = 'https://62ed0389a785760e67622eb2.mockapi.io/spots/v1';
  final http.Client client;

  CampsiteService({http.Client? client}) : client = client ?? http.Client();

  Future<List<Campsite>> getCampsites() async {
    try {
      final response = await client.get(Uri.parse('$baseUrl/campsites'));
      
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Campsite.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load campsites: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load campsites: $e');
    }
  }
} 