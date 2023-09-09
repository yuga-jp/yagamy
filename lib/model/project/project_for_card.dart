import 'package:yagamy/model/project/raw_project_for_card.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/utility/empty_to_thumbnail_placeholder_url.dart';
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
          rawProjectForCard.hoursStartFirstDay?.add(const Duration(hours: 9)),
          rawProjectForCard.hoursEndFirstDay?.add(const Duration(hours: 9)),
          rawProjectForCard.hoursStartSecondDay?.add(const Duration(hours: 9)),
          rawProjectForCard.hoursEndSecondDay?.add(const Duration(hours: 9)),
        ),
        groupName = rawProjectForCard.groupName,
        thumbnailUrl = emptyToThumbnailPlaceholderUrl(rawProjectForCard.thumbnailUrl),
        searcherProps = toSearcherPropList(
            rawProjectForCard.categoryMain,
            rawProjectForCard.categorySub,
            rawProjectForCard.area,
            rawProjectForCard.floor),
        stampRally = rawProjectForCard.stampRally;

  final String id;
  final String title;
  final String placeString;
  final String hoursString;
  final String groupName;
  final String thumbnailUrl;
  final List<SearcherProp> searcherProps;
  final bool stampRally;
}
