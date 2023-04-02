import 'package:flutter/material.dart';

import 'package:yagamy/ui/theme/custom_color.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String title;
  final bool isSelected;
  final void Function() onTap;
  final Color textColor;

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isSelected
        ? _Button(
            widget.title,
            widget.onTap,
            CustomColor.selectedSearchButtonColor,
            CustomColor.textColorOnSelectedSearchButton,
          )
        : _Button(
            widget.title,
            widget.onTap,
            CustomColor.unSelectedSearchButtonColor,
            CustomColor.textColorOnUnSelectedSearchButton,
          );
  }
}

class _Button extends StatelessWidget {
  const _Button(this.title, this.onTap, this.color, this.textColor, {Key? key})
      : super(key: key);

  final String title;
  final void Function() onTap;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        foregroundColor: MaterialStateProperty.all(textColor),
      ),
      clipBehavior: Clip.antiAlias,
      child: Text(title, style: TextStyle(color: textColor, fontSize: 13)),
    );
  }
}
