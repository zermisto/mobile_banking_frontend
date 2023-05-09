class Student {
  final String imageUrl;
  final String name;
  final String surname;
  final int year;
  final double fallSemesterGrade;
  final double cumulativeGrade;
  final int tuitionFee;

  const Student({
    required this.imageUrl,
    required this.name,
    required this.surname,
    required this.year,
    required this.fallSemesterGrade,
    required this.cumulativeGrade,
    required this.tuitionFee,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      imageUrl: json['imageUrl'],
      name: json['name'],
      surname: json['surname'],
      year: json['year'],
      fallSemesterGrade: json['fallSemesterGrade'],
      cumulativeGrade: json['cumulativeGrade'],
      tuitionFee: json['tuitionFee'],
    );
  }
}
