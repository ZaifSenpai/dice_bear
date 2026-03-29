import 'package:flutter/material.dart';

class CodeBox extends StatelessWidget {
  const CodeBox({super.key, required this.text, this.maxHeight = 220});

  final String text;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: SelectableText(
          text,
          style: const TextStyle(
            color: Color(0xFFE5E7EB),
            fontFamily: 'monospace',
            height: 1.4,
          ),
        ),
      ),
    );
  }
}
