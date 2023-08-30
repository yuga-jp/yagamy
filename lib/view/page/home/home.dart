import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:yagamy/gen/assets.gen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return CustomScrollView(
      physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverAppBar(
          title: SvgPicture.asset(
            Assets.logo.yagamiFestival2023.path,
            width: 100,
            height: 40,
          ),
          actions: const <Widget>[
            Icon(Icons.account_circle_outlined),
            SizedBox(width: 15),
          ],
          centerTitle: false,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Card(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  side:
                      BorderSide(color: Theme.of(context).colorScheme.outline),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                margin: const EdgeInsets.only(
                    left: 10, top: 5, right: 10, bottom: 10),
                child: const Column(
                  children: [
                    Text('第24回矢上祭'),
                    Text('2023年9月23日(土) 10:00-'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
