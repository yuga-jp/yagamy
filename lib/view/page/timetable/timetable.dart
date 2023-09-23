import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:yagamy/gen/assets.gen.dart';
import 'package:yagamy/model/project/timetable_project.dart';
import 'package:yagamy/model/timetable_searcher_type.dart';
import 'package:yagamy/provider/projects_provider.dart';
import 'package:yagamy/provider/selected_main_stage.dart';
import 'package:yagamy/view/page/timetable/ui_part/timetable_list.dart';

class TimetablePage extends ConsumerStatefulWidget {
  const TimetablePage({Key? key}) : super(key: key);

  @override
  ConsumerState<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends ConsumerState<TimetablePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<TimetableProject>> projectsFirstDay =
        ref.watch(timetableFirstDayProvider);
    AsyncValue<List<TimetableProject>> projectsSecondDay =
        ref.watch(timetableSecondDayProvider);

    return Center(
      child: NestedScrollView(
        physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: SvgPicture.asset(
                  Assets.logo.yagamiFestival2023.path,
                  width: 100,
                  height: 40,
                ),
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabs: const <Widget>[
                    Tab(child: Text('1日目')),
                    Tab(child: Text('2日目')),
                  ],
                ),
                centerTitle: false,
                floating: true,
                pinned: true,
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            Builder(
              builder: (BuildContext context) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: MediaQuery.of(context).size.width * 0.15,
                        ),
                        child: SegmentedButton(
                          segments: const <ButtonSegment<bool>>[
                            ButtonSegment(value: true, label: Text('メインステージ')),
                            ButtonSegment(value: false, label: Text('その他')),
                          ],
                          selected: <bool>{
                            ref.watch(isSelectedFirstDayMainStage)
                          },
                          onSelectionChanged: (Set<bool> newSelection) {
                            HapticFeedback.mediumImpact();
                            ref
                                .read(isSelectedFirstDayMainStage.notifier)
                                .state = newSelection.first;
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context).colorScheme.primary;
                              } else {
                                return Colors.transparent;
                              }
                            }),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                            enableFeedback: true,
                            splashFactory: NoSplash.splashFactory,
                          ),
                          showSelectedIcon: false,
                        ),
                      ),
                    ),
                    projectsFirstDay.when(
                      loading: () {
                        return SliverToBoxAdapter(
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            margin: const EdgeInsets.only(top: 15),
                            child: const CircularProgressIndicator.adaptive(),
                          ),
                        );
                      },
                      error: (error, stackTrace) {
                        return const SliverToBoxAdapter(
                          child: SizedBox.shrink(),
                        );
                      },
                      data: (projects) {
                        List<TimetableProject> filteredTimetableFirstDay =
                            ref.watch(filterdTimetableFirstDayProvider(
                                ref.watch(isSelectedFirstDayMainStage)));
                        return TimetableList(
                          project: filteredTimetableFirstDay,
                          day: TimetableSearcherTypeDay.firstDay,
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            Builder(
              builder: (BuildContext context) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: MediaQuery.of(context).size.width * 0.15,
                        ),
                        child: SegmentedButton(
                          segments: const <ButtonSegment<bool>>[
                            ButtonSegment(value: true, label: Text('メインステージ')),
                            ButtonSegment(value: false, label: Text('その他')),
                          ],
                          selected: <bool>{
                            ref.watch(isSelectedSecondDayMainStage)
                          },
                          onSelectionChanged: (Set<bool> newSelection) {
                            HapticFeedback.mediumImpact();
                            ref
                                .read(isSelectedSecondDayMainStage.notifier)
                                .state = newSelection.first;
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                              if (states.contains(MaterialState.selected)) {
                                return Theme.of(context).colorScheme.primary;
                              } else {
                                return Colors.transparent;
                              }
                            }),
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                            enableFeedback: true,
                            splashFactory: NoSplash.splashFactory,
                          ),
                          showSelectedIcon: false,
                        ),
                      ),
                    ),
                    projectsSecondDay.when(
                      loading: () {
                        return const SliverToBoxAdapter(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      },
                      error: (error, stackTrace) {
                        return const SliverToBoxAdapter(
                          child: SizedBox.shrink(),
                        );
                      },
                      data: (projects) {
                        List<TimetableProject> filteredTimetableSecondDay =
                            ref.watch(filteredTimetableSecondDayProvider(
                                ref.watch(isSelectedSecondDayMainStage)));
                        return TimetableList(
                          project: filteredTimetableSecondDay,
                          day: TimetableSearcherTypeDay.secondDay,
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
