// Import necessary packages
import 'package:http/http.dart' as http;
import 'dart:convert';

// Define the service class
class SampleService {
  // Define the API URL
  final String _apiUrl = 'https://api.example.com';

  // Define a function to get data from the API
  Future<dynamic> getData() async {
    // Make a GET request to the API
    final response = await http.get(Uri.parse('$_apiUrl/data'));

    // Check if the response was successful
    if (response.statusCode == 200) {
      // Return the response data
      return jsonDecode(response.body);
    } else {
      // Throw an exception if the response was not successful
      throw Exception('Failed to load data');
    }
  }

  // Define a function to post data to the API
  Future<dynamic> postData(Map<String, dynamic> data) async {
    // Make a POST request to the API
    final response = await http.post(
      Uri.parse('$_apiUrl/data'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    // Check if the response was successful
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Return the response data
      return jsonDecode(response.body);
    } else {
      // Throw an exception if the response was not successful
      throw Exception('Failed to post data');
    }
  }

  // Define a function to process input data
  String processData(String input) {
    // Process the input data by converting it to uppercase and trimming it
    return input.toUpperCase().trim();
  }
}
