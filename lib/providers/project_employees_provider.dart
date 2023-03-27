import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/employee_project.dart';
import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';

final employeeProjectProvider = Provider((ref) {
  return EmployeeProjectsNotifier();
});

class EmployeeProjectsNotifier extends StateNotifier<List<EmployeeProject>> {
  EmployeeProjectsNotifier() : super([]);

  List<EmployeeProject> employeesProjects = [];

  void pickCSVFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result == null) return;

      PlatformFile file = result.files.first;

      final input = File('${file.path}').openRead();

      final fields = await input
          .transform(utf8.decoder)
          .transform(const CsvToListConverter())
          .toList();

      for (int i = 1; i < fields.length; i++) {
        employeesProjects.add(
          EmployeeProject.fromList(fields[i]),
        );
      }

      state.addAll(employeesProjects);
    } on FileSystemException catch (error) {
      debugPrint(error.toString());
    }
  }
}
