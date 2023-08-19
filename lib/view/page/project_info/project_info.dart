import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:yagamy/model/project/project.dart';
import 'package:yagamy/view/page/project_info/ui_part/project_info_body.dart';

class ProjectInfoPage extends StatefulWidget {
  const ProjectInfoPage({Key? key}) : super(key: key);

  @override
  State<ProjectInfoPage> createState() => _ProjectInfoPageState();
}

class _ProjectInfoPageState extends State<ProjectInfoPage> {
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
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: CustomScrollView(
        physics: const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            title: const Text('企画紹介'),
            centerTitle: true,
            floating: true,
          ),
          const ProjectInfoBody(
            Project(
              title: '有名人企画',
              place: 'メインステージ',
              time: '日 / 15:00 - 16:00',
              groupName: '矢上祭実行委員会ステージ局',
              shortIntro: 'まつきりなさんによる矢上祭オリジナルトークショー！',
              intro:
                  '矢上祭名物、有名人企画！\n今回のゲストは…\nまつきりなさん！\n\nヒロインを演じた「触れた、だけだった。」はYouTubeで1,300万PVを突破し話題に。\nインスタストーリーやYouTubeでの恋愛相談返しや美容コンテンツも人気を博しています！\n\nそんなまつきりなさんに、今回なんと質問も大募集しております！矢上祭公式Twitterから質問どしどし応募しております！\nぜひ当日お越しください！',
              introExtension: '',
              groupIntro: '作問サークルは，主に算数数学に関する自作問題を作っています．去年は年間で32問を作りました．教科書には無い一風変わった問題や競技数学で出てくるようなヒラメキ問題を作っており，メンバーは各々のタイミングで自由に活動しています．今年度は，前年度以上に矢上祭を盛り上げられるように企画制作していきます！',
              mainImageUrl: 'https://picsum.photos/400/300',
              twitterUrl: 'https://twitter.com/kcs1959',
              instagramUrl: 'https://www.instagram.com/hatobas_keio_/',
              homepageUrl: 'https://jack-keio.com/',
            ),
          ),
        ],
      ),
    );
  }
}
