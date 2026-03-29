import 'package:flutter/material.dart';

class ControlCard extends StatelessWidget {
  const ControlCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surface,
      child: Padding(padding: const EdgeInsets.all(16), child: child),
    );
  }
}
