import 'package:flutter/foundation.dart' show immutable;

@immutable
class EmployeeProject {
  final int empID;
  final int projectID;
  final DateTime dateFrom;
  final DateTime? dateTo;

  const EmployeeProject({
    required this.empID,
    required this.projectID,
    required this.dateFrom,
    this.dateTo,
  });

  factory EmployeeProject.fromList(List<dynamic> list) {
    return EmployeeProject(
        empID: int.parse(list[0].toString()),
        projectID: int.parse(list[1].toString()),
        dateFrom: DateTime.parse(list[2].toString()),
        dateTo: _parseNullableDate(list[3]));
  }

  static DateTime? _parseNullableDate(dynamic value) {
    if (value == null || value.toString().toLowerCase() == "null") {
      return DateTime.now();
    }
    return DateTime.parse(value.toString());
  }
}
