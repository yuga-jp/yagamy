import 'package:flutter/material.dart';

import '../widget/custom_widgets.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  ProjectsPageState createState() => ProjectsPageState();
}

class ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100),
            projectCard(context, "Quiz30問！", "慶應Quiz研究会",
                "https://picsum.photos/300/300",
                place: "14棟-101教室", time: "10:00-15:00"),
            projectCard(context, "Quiz30問！", "慶應Quiz研究会",
                "https://picsum.photos/400/400",
                place: "14棟-101教室", time: "10:00-15:00"),
            projectCard(context, "Quiz30問！", "慶應Quiz研究会",
                "https://picsum.photos/500/500",
                place: "14棟-101教室", time: "10:00-15:00"),
            projectCard(context, "Quiz30問！", "慶應Quiz研究会",
                "https://picsum.photos/600/600",
                place: "14棟-101教室", time: "10:00-15:00"),
            projectCard(context, "Quiz30問！", "慶應Quiz研究会",
                "https://picsum.photos/700/700",
                place: "14棟-101教室", time: "10:00-15:00"),
          ],
        ),
      ),
    );
  }
}
