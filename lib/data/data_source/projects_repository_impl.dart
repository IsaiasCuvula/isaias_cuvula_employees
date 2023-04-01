import 'package:isaias_cuvula_employees/data/models/employee_project.dart';
import 'package:isaias_cuvula_employees/domain/projects_repository.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  final List<EmployeeProject> _employeesProjectsList = [];

  @override
  Future<void> pickCSVFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result == null) return;

      PlatformFile file = result.files.first;

      final csvFile = File('${file.path}').openRead();

      final csvData = await csvFile
          .transform(utf8.decoder)
          .transform(const CsvToListConverter())
          .toList();

      for (int i = 1; i < csvData.length; i++) {
        _employeesProjectsList.add(
          EmployeeProject.fromList(csvData[i]),
        );
      }
    } on FileSystemException catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  List<EmployeeProject> getEmployeeProjectList() {
    return _employeesProjectsList;
  }
}
