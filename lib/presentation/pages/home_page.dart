import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isaias_cuvula_employees/presentation/states/projects_state_notifier.dart';
import 'package:isaias_cuvula_employees/presentation/widgets/widgets.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsStateNotifier = ref.watch(projectsStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
            final employeeDataSource = EmployeeDataGrid(
              employeePairData: employeesProjects,
            );
            return employeesProjects.isEmpty
                ? const EmptyProjectsPage()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Pair of employees who have worked together',
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SfDataGrid(
                        source: employeeDataSource,
                        columnWidthMode: ColumnWidthMode.fill,
                        columns: [
                          GridColumn(
                            columnName: 'Employee ID#1',
                            label: const GridTitle(title: 'Employee ID#1'),
                          ),
                          GridColumn(
                            columnName: 'Employee ID#2',
                            label: const GridTitle(title: 'Employee ID#2'),
                          ),
                          GridColumn(
                            columnName: 'ProjectID',
                            label: const GridTitle(title: 'ProjectID'),
                          ),
                          GridColumn(
                            columnName: 'Days Worked',
                            label: const GridTitle(
                              title: 'Days Worked',
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
