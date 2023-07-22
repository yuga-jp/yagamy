import 'package:flutter/material.dart';

import 'package:yagamy/constant/theme/slide_button_theme.dart';
import 'package:yagamy/view/common/ui_part/slide_button/show_selected_bar.dart';

class SlideButton extends StatefulWidget {
  const SlideButton({
    required this.leftText,
    required this.rightText,
    this.backgroundColor,
    this.sliderColor,
    this.backgroundBorderRadius = const BorderRadius.all(Radius.circular(9)),
    this.sliderBorderRadius = const BorderRadius.all(Radius.circular(7)),
    required this.height,
    this.margin = const EdgeInsets.only(left: 30, top: 5, right: 30, bottom: 5),
    super.key,
  });

  final String leftText;
  final String rightText;
  final Color? backgroundColor;
  final Color? sliderColor;
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

  Widget _detectorPart(bool isSlideTo, String text, Color textColor) {
    return GestureDetector(
      onTap: () => setState(() {
        isSlide = isSlideTo;
      }),
      behavior: HitTestBehavior.translucent,
      child: Container(
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  color: textColor, fontSize: 15, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final SlideButtonTheme currentTheme =
        Theme.of(context).extension<SlideButtonTheme>()!;
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
              sliderColor: widget.sliderColor ??
                  Theme.of(context).extension<SlideButtonTheme>()!.sliderColor!,
              borderRadius: widget.sliderBorderRadius,
              height: widget.height * 0.85,
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: _detectorPart(
                    false, widget.leftText, currentTheme.textColor!),
              ),
              Expanded(
                flex: 1,
                child: _detectorPart(
                    true, widget.rightText, currentTheme.textColor!),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
