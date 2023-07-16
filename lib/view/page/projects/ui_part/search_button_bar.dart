import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/searcher_type.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/provider/provider.dart';
import 'package:yagamy/view/page/projects/ui_part/search_button.dart';

class SearchButtonBar extends ConsumerStatefulWidget {
  const SearchButtonBar({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchButtonBar> createState() => _SearchButtonBarState();
}

class _SearchButtonBarState extends ConsumerState<SearchButtonBar> {
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
    return Column(
      children: <Widget>[
        _SingleSearchButtonBar(SearcherProp.values
            .where(
                (searcherProp) => searcherProp.type == SearcherType.categories)
            .toList()),
        _SingleSearchButtonBar(SearcherProp.values
            .where((searcherProp) => searcherProp.type == SearcherType.places)
            .toList()),
      ],
    );
  }
}

class _SingleSearchButtonBar extends ConsumerStatefulWidget {
  const _SingleSearchButtonBar(this.list, {Key? key}) : super(key: key);

  final List<SearcherProp> list;

  @override
  ConsumerState<_SingleSearchButtonBar> createState() =>
      _SingleSearchBarState();
}

class _SingleSearchBarState extends ConsumerState<_SingleSearchButtonBar> {
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
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        itemBuilder: (context, index) {
          return Row(
            children: [
              index == 0 ? const SizedBox(width: 10) : const SizedBox(width: 4),
              SearchButton(
                title: widget.list[index].name,
                onTap: () {
                  setState(() {
                    if (ref.watch(selectedSearcherProvider) ==
                        widget.list[index]) {
                      ref.read(selectedSearcherProvider.notifier).state =
                          SearcherProp.initial;
                    } else {
                      ref.read(selectedSearcherProvider.notifier).state =
                          widget.list[index];
                    }
                  });
                },
              ),
              index == widget.list.length - 1
                  ? const SizedBox(width: 10)
                  : const SizedBox(width: 4),
            ],
          );
        },
        itemCount: widget.list.length,
      ),
    );
  }
}
