import 'package:flutter/material.dart';

import 'package:yagamy/ui/widget/card/project_card.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const <Widget>[
            SizedBox(height: 100),
            ProjectCard(
              title: "Quiz30問！",
              groupName: "慶應Quiz研究会",
              imageUrl: "https://picsum.photos/300/300",
              placeName: "14棟-101教室",
              time: "10:00-15:00",
            ),
            ProjectCard(
              title: "福引",
              groupName: "矢上祭実行委員会",
              imageUrl: "https://picsum.photos/400/400",
              placeName: "14棟-西1階",
              time: "10:00-17:00",
            ),
            ProjectCard(
              title: "スーパーコンサート",
              groupName: "矢上祭実行委員会",
              imageUrl: "https://picsum.photos/500/500",
              placeName: "メインステージ",
              time: "11:00-11:30",
            ),
            ProjectCard(
              title: "有名人が来る！",
              groupName: "慶應Quiz研究会",
              imageUrl: "https://picsum.photos/600/600",
              placeName: "12棟-101教室",
              time: "10:00-15:00",
            ),
            ProjectCard(
              title: "学祭連合企画",
              groupName: "関東学祭連合",
              imageUrl: "https://picsum.photos/700/700",
              placeName: "15棟-101教室",
              time: "12:00-15:00",
            ),
          ],
        ),
      ),
    );
  }
}
