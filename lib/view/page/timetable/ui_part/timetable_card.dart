import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/model/timetable_searcher_type.dart';
import 'package:yagamy/utility/get_hours_displaying.dart';
import 'package:yagamy/utility/get_place_displaying.dart';

class TimetableCard extends StatelessWidget {
  const TimetableCard({
    required this.project,
    this.bottomBorderColor = Colors.blue,
    required this.day,
    super.key,
  });
  final Project project;
  final Color bottomBorderColor;
  final TimetableSearcherTypeDay day;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      margin: const EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 5),
      clipBehavior: Clip.antiAlias,
      child: Ink(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(project.thumbnailPath),
            fit: BoxFit.cover,
          ),
          border:
              Border(bottom: BorderSide(color: bottomBorderColor, width: 3)),
        ),
        height: 80,
        child: Ink(
          color: Colors.black.withOpacity(0.4),
          child: InkWell(
              onTap: () {
                GoRouter.of(context).go('/timetable/project/${project.id}');
              },
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          project.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            toHoursStringForTimetable(
                              project.hoursStartFirstDay,
                              project.hoursEndFirstDay,
                              project.hoursStartSecondDay,
                              project.hoursEndSecondDay,
                              day,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          project.searcherProps.contains(SearcherProp.mainStage)
                              ? const SizedBox.shrink()
                              : Text(
                                  getPlaceDisplaying(project.area,
                                      project.floor, project.placeDetail),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
