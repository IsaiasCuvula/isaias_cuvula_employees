import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isaias_cuvula_employees/providers/project_employees_provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:isaias_cuvula_employees/widgets/employee_data_source.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeesProjects =
        ref.watch(employeeProjectProvider).employeesProjects;
    final employeeDataSource = EmployeeDataSource(
      employeeData: employeesProjects,
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(employeeProjectProvider).pickCSVFile(),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SfDataGrid(
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
        ),
      ),
    );
  }
}
