class EmployeeProject {
  int empID;
  int projectID;
  DateTime dateFrom;
  DateTime dateTo;

  EmployeeProject(
    this.empID,
    this.projectID,
    this.dateFrom,
    this.dateTo,
  );

  factory EmployeeProject.fromList(List<dynamic> list) {
    return EmployeeProject(
      int.parse(list[0].toString()),
      int.parse(list[1].toString()),
      DateTime.parse(list[2].toString()),
      list[3] == 'NULL' ? DateTime.now() : DateTime.parse(list[3].toString()),
    );
  }
}
