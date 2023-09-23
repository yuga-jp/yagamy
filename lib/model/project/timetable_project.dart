import 'package:yagamy/model/project/raw_project_for_card.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/utility/empty_to_thumbnail_placeholder_url.dart';
import 'package:yagamy/utility/to_place_string.dart';
import 'package:yagamy/utility/to_searcher_prop.dart';

class TimetableProject {
  TimetableProject({
    required this.id,
    required this.title,
    required this.placeString,
    this.hoursStartFirstDay,
    this.hoursEndFirstDay,
    this.hoursStartSecondDay,
    this.hoursEndSecondDay,
    required this.thumbnailUrl,
    required this.searcherProp,
  });

  TimetableProject.fromRawProjectForCard(RawProjectForCard rawProjectForCard)
      : id = rawProjectForCard.id,
        title = rawProjectForCard.title,
        placeString = toPlaceString(
          rawProjectForCard.area,
          rawProjectForCard.floor,
          rawProjectForCard.placeDetail,
        ),
        hoursStartFirstDay = rawProjectForCard.hoursStartFirstDay?.toLocal(),
        hoursEndFirstDay = rawProjectForCard.hoursEndFirstDay?.toLocal(),
        hoursStartSecondDay = rawProjectForCard.hoursStartSecondDay?.toLocal(),
        hoursEndSecondDay = rawProjectForCard.hoursEndSecondDay?.toLocal(),
        thumbnailUrl =
            emptyToThumbnailPlaceholderUrl(rawProjectForCard.thumbnailUrl),
        searcherProp = toSearcherPropPlace(
            rawProjectForCard.area, rawProjectForCard.floor);

  final String id;
  final String title;
  final String placeString;
  final DateTime? hoursStartFirstDay;
  final DateTime? hoursEndFirstDay;
  final DateTime? hoursStartSecondDay;
  final DateTime? hoursEndSecondDay;
  final String thumbnailUrl;
  final SearcherProp searcherProp;
}
