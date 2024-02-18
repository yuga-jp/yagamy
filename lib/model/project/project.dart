import 'package:yagamy/model/project/raw_project.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/utility/get_main_image_path.dart';
import 'package:yagamy/utility/get_thumbnail_path.dart';
import 'package:yagamy/utility/get_searcher_prop.dart';

class Project {
  Project({
    required this.id,
    required this.title,
    required this.area,
    required this.floor,
    required this.placeDetail,
    this.hoursStartFirstDay,
    this.hoursEndFirstDay,
    this.hoursStartSecondDay,
    this.hoursEndSecondDay,
    required this.groupName,
    required this.shortIntro,
    required this.intro,
    required this.introExtension,
    required this.groupIntro,
    required this.thumbnailPath,
    required this.mainImagePath,
    required this.twitterId,
    required this.instagramId,
    required this.homepageUrl,
    required this.searcherProps,
    required this.stampRally,
  });

  Project.fromRawProject(RawProject rawProject)
      : id = rawProject.id,
        title = rawProject.title,
        area = rawProject.area,
        floor = rawProject.floor,
        placeDetail = rawProject.placeDetail,
        hoursStartFirstDay = rawProject.hoursStartFirstDay?.toLocal(),
        hoursEndFirstDay = rawProject.hoursEndFirstDay?.toLocal(),
        hoursStartSecondDay = rawProject.hoursStartSecondDay?.toLocal(),
        hoursEndSecondDay = rawProject.hoursEndSecondDay?.toLocal(),
        groupName = rawProject.groupName,
        shortIntro = rawProject.shortIntro,
        intro = rawProject.intro,
        introExtension = rawProject.introExtension,
        groupIntro = rawProject.groupIntro,
        thumbnailPath = getTumbnailPath(rawProject.id, rawProject.hasThumbnail),
        mainImagePath =
            getMainImagePath(rawProject.id, rawProject.hasMainImage),
        twitterId = rawProject.twitterId,
        instagramId = rawProject.instagramId,
        homepageUrl = rawProject.homepageUrl,
        searcherProps = getSearcherPropList(rawProject.categoryMain,
            rawProject.categorySub, rawProject.area, rawProject.floor),
        stampRally = rawProject.stampRally;

  final String id;
  final String title;
  final String area;
  final String floor;
  final String placeDetail;
  final DateTime? hoursStartFirstDay;
  final DateTime? hoursEndFirstDay;
  final DateTime? hoursStartSecondDay;
  final DateTime? hoursEndSecondDay;
  final String groupName;
  final String shortIntro;
  final String intro;
  final String introExtension;
  final String groupIntro;
  final String thumbnailPath;
  final String mainImagePath;
  final String twitterId;
  final String instagramId;
  final String homepageUrl;
  final List<SearcherProp> searcherProps;
  final bool stampRally;
}
