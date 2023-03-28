import 'package:isaias_cuvula_employees/data/models/employee_project.dart';

abstract class ProjectsRepository {
  Future<List<EmployeeProject>> getEmployeeProjectList();
  Future<void> pickCSVFile();
}
