import 'package:flutter/foundation.dart' show immutable;

@immutable
class EmployeePair {
  final int empId1;
  final int empId2;
  final int projectId;
  final int daysWorked;

  const EmployeePair({
    required this.empId1,
    required this.empId2,
    required this.projectId,
    required this.daysWorked,
  });

  @override
  bool operator ==(Object other) =>
      other is EmployeePair && empId1 == other.empId1 && empId2 == other.empId2;

  @override
  int get hashCode => empId1.hashCode ^ empId2.hashCode;
}
