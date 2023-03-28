import 'package:isaias_cuvula_employees/data/models/models.dart';

abstract class ProjectsRepository {
  Future<List<EmployeeProject>> getEmployeeProjectList();
  Future<void> pickCSVFile();
}
