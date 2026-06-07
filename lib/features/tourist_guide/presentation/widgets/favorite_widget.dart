import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FavoriteWidget extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback onPressed;
  final double size;
  final bool showCount;

  const FavoriteWidget({
    super.key,
    required this.isFavorite,
    required this.onPressed,
    this.size = 24.0,
    this.showCount = false,
  });

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 160),
    value: 0.0,
  );

  late final Animation<double> _scaleAnimation = Tween<double>(
    begin: 1.0,
    end: 0.85,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onPressed();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final iconWidget = GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      behavior: HitTestBehavior.opaque,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutBack,
                ),
                child: child,
              );
            },
            child: Icon(
              LucideIcons.heart,
              key: ValueKey<bool>(widget.isFavorite),
              color: widget.isFavorite ? Colors.red : Colors.grey.shade400,
              size: widget.size,
            ),
          ),
        ),
      ),
    );

    if (!widget.showCount) {
      return iconWidget;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        iconWidget,
        SizedBox(
          width: 18,
          child: Text(
            widget.isFavorite ? '42' : '41',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'GoogleSans',
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
