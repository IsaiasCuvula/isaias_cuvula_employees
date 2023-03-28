import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isaias_cuvula_employees/data/data_source/projects_repository_impl.dart';
import 'package:isaias_cuvula_employees/domain/projects_repository.dart';

final projectsRepositoryProvider = Provider<ProjectsRepository>((ref) {
  return ProjectsRepositoryImpl();
});
