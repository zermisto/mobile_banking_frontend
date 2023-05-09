import '../../../services/get_student_data.dart';

class ProfileController {
  Future<List<String>> getStudentFirstNameList({
    required List<String> idList,
  }) async {
    List<String> firstNameList = [];

    for (final id in idList) {
      final firstName = await getStudentFirstName(
        studentId: id,
      );
      firstNameList.add(firstName);
    }

    return firstNameList;
  }

  Future<String> getStudentFirstName({
    required String studentId,
  }) async {
    final studentDataList = await GetStudentDataService().getstudentdata();

    for (final student in studentDataList) {
      if (student.id == studentId) return student.firstName!;
    }

    return studentId;
  }

  Future<String> getStudentLastName({
    required String studentId,
  }) async {
    final studentDataList = await GetStudentDataService().getstudentdata();

    for (final student in studentDataList) {
      if (student.id == studentId) return student.lastName!;
    }

    return studentId;
  }

  Future<String?> getStudentClass({
    required String studentId,
  }) async {
    final studentDataList = await GetStudentDataService().getstudentdata();

    for (final student in studentDataList) {
      if (student.id == studentId) return student.class1;
    }

    return studentId;
  }

  Future<String?> getStudentGPA({
    required String studentId,
  }) async {
    final studentDataList = await GetStudentDataService().getstudentdata();

    for (final student in studentDataList) {
      if (student.id == studentId) return student.gpa;
    }

    return studentId;
  }

  Future<String?> getStudentCredit({
    required String studentId,
  }) async {
    final studentDataList = await GetStudentDataService().getstudentdata();

    for (final student in studentDataList) {
      if (student.id == studentId) return student.credit;
    }

    return studentId;
  }

  Future<String?> getStudentEmail({
    required String studentId,
  }) async {
    final studentDataList = await GetStudentDataService().getstudentdata();

    for (final student in studentDataList) {
      if (student.id == studentId) return student.email;
    }

    return studentId;
  }

  Future<String?> getStudentPhone({
    required String studentId,
  }) async {
    final studentDataList = await GetStudentDataService().getstudentdata();

    for (final student in studentDataList) {
      if (student.id == studentId) return student.phone;
    }

    return studentId;
  }

  Future<String?> getStudentAddress({
    required String studentId,
  }) async {
    final studentDataList = await GetStudentDataService().getstudentdata();

    for (final student in studentDataList) {
      if (student.id == studentId) return student.address;
    }

    return studentId;
  }
}
