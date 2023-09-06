import 'package:yagamy/model/project/raw_project_for_card.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/utility/to_hours_string.dart';
import 'package:yagamy/utility/to_place_string.dart';
import 'package:yagamy/utility/to_searcher_prop.dart';

class ProjectForCard {
  ProjectForCard({
    required this.id,
    required this.title,
    required this.placeString,
    required this.hoursString,
    required this.groupName,
    required this.thumbnailUrl,
    required this.searcherProps,
    required this.stampRally,
  });

  ProjectForCard.fromRawProjectForCard(RawProjectForCard rawProjectForCard)
      : id = rawProjectForCard.id,
        title = rawProjectForCard.title,
        placeString = toPlaceString(rawProjectForCard.area,
            rawProjectForCard.floor, rawProjectForCard.placeDetail),
        hoursString = toHoursString(
          rawProjectForCard.hoursStartFirstDay,
          rawProjectForCard.hoursEndFirstday,
          rawProjectForCard.hoursStartSecondDay,
          rawProjectForCard.hoursEndSecondDay,
        ),
        groupName = rawProjectForCard.groupName,
        thumbnailUrl = rawProjectForCard.thumbnailUrl,
        searcherProps = toSearcherPropList(
            rawProjectForCard.categoryMain,
            rawProjectForCard.categorySub,
            rawProjectForCard.area,
            rawProjectForCard.floor),
        stampRally = rawProjectForCard.stampRally == 'true';

  final String id;
  final String title;
  final String placeString;
  final String hoursString;
  final String groupName;
  final String thumbnailUrl;
  final List<SearcherProp> searcherProps;
  final bool stampRally;
}
