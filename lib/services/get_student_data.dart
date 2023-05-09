import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/student2.dart';

class GetStudentDataService {
  Future<List<Student2>> getstudentdata() async {
    final response = await http.get(Uri.parse('https://mb-backend-rawipol19.cloud.okteto.net/parent'));
    if (response.statusCode == 200) {
      final data = response.body;
      final jsonData = jsonDecode(data);

      final List<Student2> studentDataList = jsonData[0]['Student'].map<Student2>((student) => Student2.fromJson(student)).toList();

      return studentDataList;
    } else {
      throw Exception('Failed to load album');
    }
  }
}

