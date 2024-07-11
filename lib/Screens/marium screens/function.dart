import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchPrediction(Map<String, dynamic> inputData) async {
  final url = Uri.parse('http://192.168.100.10:5000/api'); // Replace with your Flask API URL
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode(inputData),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load prediction');
  }
}
