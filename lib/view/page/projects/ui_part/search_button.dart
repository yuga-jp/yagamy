import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/provider/provider.dart';

import 'package:yagamy/constant/theme/search_button_theme.dart';

class SearchButton extends ConsumerStatefulWidget {
  const SearchButton({
    Key? key,
    required this.searcherProp,
    required this.onTap,
  }) : super(key: key);

  final SearcherProp searcherProp;
  final void Function() onTap;

  @override
  ConsumerState<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends ConsumerState<SearchButton> {
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
    final SearchButtonTheme currentTheme = Theme.of(context).extension<SearchButtonTheme>()!;
    return ref.watch(selectedSearcherProvider) == widget.searcherProp
        ? _Button(
            widget.searcherProp.name,
            widget.onTap,
            currentTheme.selectedColor!,
            currentTheme.selectedTextColor!,
          )
        : _Button(
            widget.searcherProp.name,
            widget.onTap,
            currentTheme.unSelectedColor!,
            currentTheme.unSelectedTextColor!,
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
