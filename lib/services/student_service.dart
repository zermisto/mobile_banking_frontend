import 'dart:convert';

import 'package:mbanking_mock/models/student.dart';
import 'package:http/http.dart' as http;

class StudentService {
  Future<List<Student>> getStudentList() async {
    final response = await http.get(Uri.parse('someUrl'));

    if (response.statusCode == 200) {
      final List<dynamic> studentList = jsonDecode(response.body);

      return studentList
          .map<Student>(
            (entry) => Student.fromJson(
              jsonDecode(response.body),
            ),
          )
          .toList();
    } else {
      throw Exception('some error');
    }
  }
}
