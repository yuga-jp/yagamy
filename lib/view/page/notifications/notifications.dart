import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:yagamy/gen/assets.gen.dart';
import 'package:yagamy/model/notification/parsed_notification.dart';
import 'package:yagamy/provider/notifications_provider.dart';
import 'package:yagamy/view/page/notifications/ui_part/notification_card.dart';

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {
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
    AsyncValue<List<ParsedNotification>> notifications =
        ref.watch(notificationsProvider);

    return notifications.when(
      loading: () {
        return const Text('loading');
      },
      error: (error, stackTrace) {
        return const Text('error');
      },
      data: (notifications) {
        return CustomScrollView(
          physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            SliverAppBar(
              title: SvgPicture.asset(
                Assets.logo.yagamiFestival2023.path,
                width: 100,
                height: 40,
              ),
              centerTitle: false,
              floating: true,
              pinned: true,
            ),
            SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return NotificationCard(notification: notifications[index]);
                },
                childCount: notifications.length,
              ),
              itemExtent: 60,
            ),
          ],
        );
      },
    );
  }
}
