import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isaias_cuvula_employees/data/models/employee_project.dart';
import 'package:isaias_cuvula_employees/domain/projects_provider.dart';
import 'package:isaias_cuvula_employees/domain/projects_repository.dart';

final projectsStateNotifierProvider = StateNotifierProvider<
    ProjectsStateNotifier, AsyncValue<List<EmployeeProject>>>((ref) {
  final projectsRepository = ref.read(projectsRepositoryProvider);
  return ProjectsStateNotifier(projectsRepository);
});

class ProjectsStateNotifier
    extends StateNotifier<AsyncValue<List<EmployeeProject>>> {
  ProjectsStateNotifier(this._projectsRepository)
      : super(const AsyncValue.loading());

  final ProjectsRepository _projectsRepository;

  Future<void> _fetchEmployeeProjects() async {
    state = const AsyncValue.loading();
    try {
      final employeeProjects =
          await _projectsRepository.getEmployeeProjectList();
      state = AsyncValue.data(employeeProjects);
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
}
