import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/model/sale_situation/sale_situation.dart';
import 'package:yagamy/repository/sale_situation_repository.dart';

final saleSituationsProvider = FutureProvider<List<SaleSituation>>((ref) async {
  return SaleSituationRepository.fetchSaleSituations();
});
