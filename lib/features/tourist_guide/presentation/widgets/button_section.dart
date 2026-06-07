import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  final String phoneNumber;
  final String locationName;
  final String shareMessage;

  const ButtonSection({
    super.key,
    required this.phoneNumber,
    required this.locationName,
    required this.shareMessage,
  });

  void _launchCall(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Llamando a $phoneNumber'),
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }

  void _launchRoute(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Abriendo rutas para $locationName'),
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }

  void _launchShare(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Compartiendo: $shareMessage'),
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color enabledColor = Color(0xFFFF6D00);

    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(
            context,
            enabledColor,
            Icons.call,
            'LLAMAR',
            () => _launchCall(context),
          ),
          _buildButtonColumn(
            context,
            enabledColor,
            Icons.near_me,
            'RUTA',
            () => _launchRoute(context),
          ),
          _buildButtonColumn(
            context,
            enabledColor,
            Icons.share,
            'COMPARTIR',
            () => _launchShare(context),
          ),
        ],
      ),
    );
  }

  Column _buildButtonColumn(
    BuildContext context,
    Color color,
    IconData icon,
    String label,
    VoidCallback onPressed,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon),
            color: color,
            onPressed: onPressed,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
