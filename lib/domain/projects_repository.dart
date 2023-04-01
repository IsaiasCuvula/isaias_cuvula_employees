import 'package:isaias_cuvula_employees/data/models/models.dart';

abstract class ProjectsRepository {
  List<EmployeeProject> getEmployeeProjectList();
  Future<void> pickCSVFile();
}
