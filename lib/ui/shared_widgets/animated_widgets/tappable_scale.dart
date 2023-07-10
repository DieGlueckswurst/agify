import 'package:flutter/material.dart';

typedef TapScaleBuilder = Widget Function(
  BuildContext context,
  bool isTapped,
);

class TappableScale extends StatefulWidget {
  final VoidCallback onTap;
  final TapScaleBuilder builder;
  const TappableScale({
    super.key,
    required this.onTap,
    required this.builder,
  });

  @override
  State<TappableScale> createState() => _TappableScaleState();
}

class _TappableScaleState extends State<TappableScale>
    with SingleTickerProviderStateMixin {
  bool isTapped = false;

  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.0,
      upperBound: 0.03,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    // Using Listener to catch tapDown because GestureDetector has a small delay
    // -> https://stackoverflow.com/a/53063398/11968226
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Listener(
        onPointerDown: (event) {
          _onTapDown();
        },
        onPointerUp: (event) {
          _onTapCancel();
        },
        child: GestureDetector(
          onTap: widget.onTap,
          onTapCancel: _onTapCancel,
          child: Transform.scale(
            scale: _scale,
            child: widget.builder(
              context,
              isTapped,
            ),
          ),
        ),
      ),
    );
  }

  void _onTapDown() {
    _controller.forward();
    setState(() {
      isTapped = true;
    });
  }

  void _onTapCancel() {
    _controller.reverse();
    setState(() {
      isTapped = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
