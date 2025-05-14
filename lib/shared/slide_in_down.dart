import 'package:flutter/material.dart';

class SlideInDown extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final double offsetY;
  final void Function(AnimationController controller)? onInitController;

  const SlideInDown({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOut,
    this.offsetY = -1.0, // 1.0 es una pantalla completa
    this.onInitController,
  });

  @override
  State<SlideInDown> createState() => _SlideInDownState();
}

class _SlideInDownState extends State<SlideInDown>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this);

    _animation = Tween<Offset>(
      begin: Offset(0, widget.offsetY),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    // Exponer el controlador
    widget.onInitController?.call(_controller);

    // Iniciar animación por defecto
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation, child: widget.child);
  }
}
