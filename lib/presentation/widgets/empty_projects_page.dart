import 'package:flutter/material.dart';

class EmptyProjectsPage extends StatelessWidget {
  const EmptyProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.folder_open_outlined,
            size: 100,
            color: Colors.grey,
          ),
          const SizedBox(height: 20),
          Text(
            'No common projects found!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Please add a CSV file to view the Pair of employees who have worked together.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
