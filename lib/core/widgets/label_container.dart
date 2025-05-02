import 'package:flutter/material.dart';

class LabelContainer extends StatelessWidget {
  final String text;
  final Color color;
  const LabelContainer({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: Text(
        text,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
