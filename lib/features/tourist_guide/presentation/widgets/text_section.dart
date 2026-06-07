import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String description;

  const TextSection({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Text(
        description,
        style: TextStyle(
          fontFamily: 'GoogleSans',
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: Colors.grey.shade700,
          height: 1.65,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
