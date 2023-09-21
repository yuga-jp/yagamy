import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yagamy/model/advertisement/advertisement.dart';
import 'package:yagamy/repository/advertisements_repository.dart';

final advertisementsProvider = FutureProvider<List<Advertisement>>((ref) async {
  return AdvertisementsRepository.fetchAdvertisements();
});
