import 'package:flutter/material.dart';
import 'package:yagamy/constant/custom_color.dart';

import 'package:yagamy/view/common/ui_part/slide_button/show_selected_bar.dart';

class SlideButton extends StatefulWidget {
  const SlideButton({
    required this.leftText,
    required this.rightText,
    this.backgroundColor = CustomColor.slideButtonBackgroundColor,
    this.sliderColor = CustomColor.slideButtonSliderColor,
    this.backgroundBorderRadius = const BorderRadius.all(Radius.circular(9)),
    this.sliderBorderRadius = const BorderRadius.all(Radius.circular(7)),
    required this.height,
    this.margin = const EdgeInsets.only(left: 30, top: 5, right: 30, bottom: 5),
    super.key,
  });

  final String leftText;
  final String rightText;
  final Color backgroundColor;
  final Color sliderColor;
  final BorderRadiusGeometry? backgroundBorderRadius;
  final BorderRadiusGeometry? sliderBorderRadius;
  final double height;
  final EdgeInsetsGeometry? margin;

  @override
  State<SlideButton> createState() => _SlideButtonState();
}

class _SlideButtonState extends State<SlideButton> {
  late bool isSlide;

  @override
  void initState() {
    super.initState();
    isSlide = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.backgroundBorderRadius,
      ),
      height: widget.height,
      margin: widget.margin,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          FractionallySizedBox(
            widthFactor: 0.5,
            child: ShowSelectedBar(
              isSlide: isSlide,
              sliderColor: widget.sliderColor,
              borderRadius: widget.sliderBorderRadius,
              height: widget.height * 0.85,
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => setState(() {
                    isSlide = false;
                  }),
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    constraints: const BoxConstraints.expand(),
                    child: Center(
                      child: Text(widget.leftText,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => setState(() {
                    isSlide = true;
                  }),
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    constraints: const BoxConstraints.expand(),
                    child: Center(
                      child: Text(widget.rightText,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
