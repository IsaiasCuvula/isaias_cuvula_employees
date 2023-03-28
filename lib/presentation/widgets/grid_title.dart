import 'package:flutter/material.dart';

class GridTitle extends StatelessWidget {
  const GridTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(
        textAlign: TextAlign.center,
        title,
      ),
    );
  }
}
