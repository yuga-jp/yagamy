import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/search_button_bar_type.dart';
import 'package:yagamy/model/search_button_prop.dart';
import 'package:yagamy/provider/notifier.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

final buttonsProvider = Provider<List<SearchButtonProp>>((ref) => [
      SearchButtonProp('アクティビティ', SearchButtonBarType.categories),
      SearchButtonProp('物品販売', SearchButtonBarType.categories),
      SearchButtonProp('パフォーマンス', SearchButtonBarType.categories),
      SearchButtonProp('コンサート', SearchButtonBarType.categories),
      SearchButtonProp('食品販売', SearchButtonBarType.categories),
      SearchButtonProp('11棟', SearchButtonBarType.places),
      SearchButtonProp('12棟', SearchButtonBarType.places),
      SearchButtonProp('13棟', SearchButtonBarType.places),
      SearchButtonProp('14棟', SearchButtonBarType.places),
      SearchButtonProp('21棟', SearchButtonBarType.places),
      SearchButtonProp('グラウンド', SearchButtonBarType.places),
      SearchButtonProp('縁日', SearchButtonBarType.places),
    ]);

final selectedSearchButtonProvider =
    StateNotifierProvider<SelectedSearchButtonNotifier, SearchButtonProp>(
        (ref) => SelectedSearchButtonNotifier());
