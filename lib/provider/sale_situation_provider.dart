import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/sale_situation/sale_situation.dart';
import 'package:yagamy/provider/sale_situations_provider.dart';

final saleSituationProvider =
    FutureProvider.autoDispose.family<SaleSituation, String>((ref, id) async {
  final salesSituations = ref.watch(saleSituationsProvider);

  return salesSituations.maybeWhen(
    orElse: () {
      throw Exception();
    },
    data: (saleSituations) {
      return saleSituations
          .where((saleSituation) => saleSituation.id == id)
          .first;
    },
  );
});
