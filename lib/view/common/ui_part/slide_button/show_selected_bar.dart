import 'package:flutter/material.dart';

class ShowSelectedBar extends StatefulWidget {
  const ShowSelectedBar({
    this.isSlide = false,
    required this.sliderColor,
    required this.borderRadius,
    required this.width,
    required this.height,
    super.key,
  });

  final bool isSlide;
  final Color sliderColor;
  final BorderRadiusGeometry? borderRadius;
  final double width;
  final double height;

  @override
  State<ShowSelectedBar> createState() => _ShowSelectedState();
}

class _ShowSelectedState extends State<ShowSelectedBar>
    with SingleTickerProviderStateMixin {
  static const double _widthScale = 0.97;

  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 150), vsync: this);

    _offsetAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(1.0 , 0)).animate(
            CurvedAnimation(
                parent: _controller,
                curve: Curves.easeOutExpo,
                reverseCurve: Curves.easeInExpo));
  }

  @override
  void didUpdateWidget(ShowSelectedBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_controller.isAnimating) return;
    if (widget.isSlide) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Material(
        elevation: 1.5,
        borderRadius: widget.borderRadius,
        child: Container(
          decoration: BoxDecoration(
            color: widget.sliderColor,
            borderRadius: widget.borderRadius,
          ),
          width: widget.width * _widthScale,
          height: widget.height,
          margin: EdgeInsets.only(
            left: widget.width * (1 - _widthScale) / 2,
            top: 0,
            right: widget.width * (1 - _widthScale) / 2,
            bottom: 0,
          ),
        ),
      ),
    );
  }
}
