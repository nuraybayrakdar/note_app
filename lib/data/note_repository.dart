import 'package:http/http.dart' as http;

import 'api.dart';

class NoteRepository {
  Future<void> fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(api));
      //var data = response.body;
      print(response.body);
    } catch (e) {
      print("error is $e");
    }
  }
}
