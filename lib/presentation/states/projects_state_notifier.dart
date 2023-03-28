import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isaias_cuvula_employees/data/models/models.dart';
import 'package:isaias_cuvula_employees/domain/domain.dart';

final projectsStateNotifierProvider = StateNotifierProvider<
    ProjectsStateNotifier, AsyncValue<List<EmployeePair>>>((ref) {
  final projectsRepository = ref.read(projectsRepositoryProvider);
  return ProjectsStateNotifier(
    projectsRepository,
    const AsyncValue.data([]),
  );
});

class ProjectsStateNotifier
    extends StateNotifier<AsyncValue<List<EmployeePair>>> {
  ProjectsStateNotifier(
    this._projectsRepository,
    AsyncValue<List<EmployeePair>> employeesPair,
  ) : super(employeesPair);

  final ProjectsRepository _projectsRepository;

  Future<void> _fetchEmployeeProjects() async {
    try {
      final employeeProjects =
          await _projectsRepository.getEmployeeProjectList();

      _findCommonProjects(employeeProjects);
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }

  Future<void> pickCSVFile() async {
    try {
      await _projectsRepository.pickCSVFile().then((value) async {
        await _fetchEmployeeProjects();
      });
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }

  Future<void> _findCommonProjects(
    List<EmployeeProject> employeeProjectsList,
  ) async {
    state = const AsyncValue.loading();
    Set<EmployeePair> employeePairs = {};

    try {
      for (int i = 0; i < employeeProjectsList.length - 1; i++) {
        final employee1 = employeeProjectsList[i];
        for (int j = i + 1; j < employeeProjectsList.length; j++) {
          final employee2 = employeeProjectsList[j];
          if (employee1.projectID == employee2.projectID &&
              employee1.empID != employee2.empID) {
            employeePairs.add(
              EmployeePair(
                empId1: employee1.empID,
                empId2: employee2.empID,
                projectId: employee1.projectID,
                daysWorked: 9,
              ),
            );
          }
        }
      }
      state = AsyncValue.data(employeePairs.toList());
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }
}
