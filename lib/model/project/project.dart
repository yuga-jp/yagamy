import 'package:yagamy/model/project/raw_project.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/utility/to_place_string.dart';
import 'package:yagamy/utility/to_searcher_prop.dart';

class Project {
  Project({
    required this.id,
    required this.title,
    required this.placeString,
    required this.hoursString,
    required this.groupName,
    required this.shortIntro,
    required this.intro,
    required this.introExtension,
    required this.groupIntro,
    required this.thumbnailUrl,
    required this.mainImageUrl,
    required this.twitterId,
    required this.instagramId,
    required this.homepageUrl,
    required this.searcherProps,
  });

  Project.fromRawProject(RawProject rawProject)
      : id = rawProject.id,
        title = rawProject.title,
        placeString = toPlaceString(
            rawProject.area, rawProject.floor, rawProject.placeDetail),
        hoursString = rawProject.hoursFirstDay,
        groupName = rawProject.groupName,
        shortIntro = rawProject.shortIntro,
        intro = rawProject.intro,
        introExtension = rawProject.introExtension,
        groupIntro = rawProject.groupIntro,
        thumbnailUrl = rawProject.thumbnailUrl,
        mainImageUrl = rawProject.mainImageUrl,
        twitterId = rawProject.twitterId,
        instagramId = rawProject.instagramId,
        homepageUrl = rawProject.homepageUrl,
        searcherProps = toSearcherPropList(
            rawProject.categoryMain, rawProject.categorySub, rawProject.area, rawProject.floor);

  Project.empty({
    this.id = 0,
    this.title = '',
    this.placeString = '',
    this.hoursString = '',
    this.groupName = '',
    this.shortIntro = '',
    this.intro = '',
    this.introExtension = '',
    this.groupIntro = '',
    this.thumbnailUrl = '',
    this.mainImageUrl = '',
    this.twitterId = '',
    this.instagramId = '',
    this.homepageUrl = '',
    this.searcherProps = const [],
  });

  final int id;
  final String title;
  final String placeString;
  final String hoursString;
  final String groupName;
  final String shortIntro;
  final String intro;
  final String introExtension;
  final String groupIntro;
  final String thumbnailUrl;
  final String mainImageUrl;
  final String twitterId;
  final String instagramId;
  final String homepageUrl;
  final List<SearcherProp> searcherProps;
}
