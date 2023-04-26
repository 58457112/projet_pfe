import 'dart:convert';
import 'package:http/http.dart' as http;

// ...

void sendDataToApi(DateTime selectedDay) async {
  var url = Uri.parse('https://example.com/api');
  var response =
      await http.post(url, body: {'selectedDay': selectedDay.toString()});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  // traitement de la réponse JSON
  var jsonResponse = json.decode(response.body);
  var dateRdv = jsonResponse['date_rdv'];
  var id = jsonResponse['id'];
  print('Date RDV: $dateRdv');
  print('ID: $id');
}
