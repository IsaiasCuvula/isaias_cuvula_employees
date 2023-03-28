import 'package:flutter/material.dart';
import 'package:isaias_cuvula_employees/data/models/employees_pair.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EmployeeDataGrid extends DataGridSource {
  EmployeeDataGrid({
    required List<EmployeePair> employeePairData,
  }) {
    _employeeData = employeePairData
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<int>(columnName: 'Employee ID#1', value: e.empId1),
              DataGridCell<int>(columnName: 'Employee ID#2', value: e.empId2),
              DataGridCell<int>(
                columnName: 'ProjectID',
                value: e.projectId,
              ),
              DataGridCell<int>(
                columnName: 'Days worked',
                value: e.daysWorked,
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
