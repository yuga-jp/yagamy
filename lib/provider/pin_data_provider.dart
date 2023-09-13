import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yagamy/model/pin_data/pin_data.dart';
import 'package:yagamy/repository/pin_data_repository.dart';

final pinDataProvider =
    FutureProvider<List<PinData>>((ref) => PinDataRepository.fetchPinData());
