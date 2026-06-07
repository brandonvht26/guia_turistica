import 'package:flutter/material.dart';

class ConsecutiveTextField extends StatefulWidget {
  final String hintText;
  final bool isLast;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  const ConsecutiveTextField({
    super.key,
    required this.hintText,
    this.isLast = false,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
  });

  @override
  State<ConsecutiveTextField> createState() => _ConsecutiveTextFieldState();
}

class _ConsecutiveTextFieldState extends State<ConsecutiveTextField> {
  late final FocusNode _internalFocus;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _internalFocus = widget.focusNode ?? FocusNode();
    _internalFocus.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _internalFocus.removeListener(_handleFocusChange);
    // Solo hacemos dispose si nosotros creamos el FocusNode
    if (widget.focusNode == null) {
      _internalFocus.dispose();
    }
    super.dispose();
  }

  void _handleFocusChange() {
    if (_isFocused != _internalFocus.hasFocus) {
      setState(() {
        _isFocused = _internalFocus.hasFocus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: AnimatedScale(
        scale: _isFocused ? 1.02 : 1.0, // Ligero aumento al recibir foco
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        child: TextFormField(
          controller: widget.controller,
          focusNode: _internalFocus,
          keyboardType: widget.keyboardType,
          textInputAction: widget.isLast ? TextInputAction.done : TextInputAction.next,
          onFieldSubmitted: (_) {
            if (!widget.isLast && widget.nextFocusNode != null) {
              FocusScope.of(context).requestFocus(widget.nextFocusNode);
            }
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          ),
        ),
      ),
    );
  }
}
