import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isaias_cuvula_employees/presentation/states/projects_state_notifier.dart';
import 'package:isaias_cuvula_employees/presentation/widgets/employee_data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsStateNotifier = ref.watch(projectsStateNotifierProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ref.read(projectsStateNotifierProvider.notifier).pickCSVFile();
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: projectsStateNotifier.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Center(child: Text(e.toString())),
            data: (employeesProjects) {
              final employeeDataSource = EmployeeDataSource(
                employeeData: employeesProjects,
              );
              return SfDataGrid(
                source: employeeDataSource,
                columnWidthMode: ColumnWidthMode.fill,
                columns: [
                  GridColumn(
                    columnName: 'empID',
                    label: Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'EmpID',
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'projectID',
                    label: Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'ProjectID',
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'dateFrom',
                    label: Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'DateFrom',
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'dateTo',
                    label: Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'DateTo',
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
