import 'package:flutter/material.dart';
import '../../data/models/employee_project.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<EmployeeProject> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<int>(columnName: 'empID', value: e.empID),
              DataGridCell<int>(columnName: 'projectID', value: e.projectID),
              DataGridCell<String>(
                columnName: 'dateFrom',
                value: e.dateFrom.toIso8601String(),
              ),
              DataGridCell<String>(
                columnName: 'dateTo',
                value: e.dateTo?.toIso8601String(),
              ),
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
