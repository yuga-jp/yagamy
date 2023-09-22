import 'package:yagamy/model/sale_siituation_type.dart';

extension SaleSituationTypeExtension on SaleSituationType {
  String toJpString() {
    switch (this) {
      case SaleSituationType.onSale:
        return '販売中';
      case SaleSituationType.limited:
        return '残りわずか';
      case SaleSituationType.unavailable:
        return '販売停止';
    }
  }
}
