import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:yagamy/gen/assets.gen.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/provider/notifications_provider.dart';
import 'package:yagamy/provider/projects_provider.dart';
import 'package:yagamy/view/page/home/ui_part/notification_card.dart';

class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Project>> projects = ref.watch(projectsProvider);
    AsyncValue<List<ParsedNotification>> notifications =
        ref.watch(notificationsProvider);

    if (projects is AsyncLoading || notifications is AsyncLoading) {
      return const Text('loading');
    } else if (projects is AsyncError || notifications is AsyncError) {
      return const Text('error');
    }
    return CustomScrollView(
      physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverAppBar(
          title: SvgPicture.asset(
            Assets.logo.yagamiFestival2023.path,
            width: 100,
            height: 40,
          ),
          centerTitle: false,
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return NotificationCard(
                  notification: notifications.value![index]);
            },
            childCount: notifications.value!.length,
          ),
          itemExtent: 60,
        )
      ],
    );
  }
}
