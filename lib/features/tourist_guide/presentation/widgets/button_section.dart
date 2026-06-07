import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
    const Color accentColor = Color(0xFFFF6D00);

    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ActionButton(
            icon: LucideIcons.phone,
            label: 'LLAMAR',
            accentColor: accentColor,
            onPressed: () => _launchCall(context),
          ),
          _ActionButton(
            icon: LucideIcons.navigation,
            label: 'RUTA',
            accentColor: accentColor,
            onPressed: () => _launchRoute(context),
          ),
          _ActionButton(
            icon: LucideIcons.share2,
            label: 'COMPARTIR',
            accentColor: accentColor,
            onPressed: () => _launchShare(context),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color accentColor;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.accentColor,
    required this.onPressed,
  });

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.88 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOutCubic,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: widget.accentColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                widget.icon,
                color: widget.accentColor,
                size: 22,
              ),
            ),
            Text(
              widget.label,
              style: TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade600,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
