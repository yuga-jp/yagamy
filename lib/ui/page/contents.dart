import 'package:flutter/material.dart';

import 'package:yagamy/ui/page/common/camera.dart';
import 'package:yagamy/ui/page/common/ticket.dart';
import 'package:yagamy/ui/widget/card/content_card.dart';

class ContentsPage extends StatefulWidget {
  const ContentsPage({Key? key}) : super(key: key);

  @override
  State<ContentsPage> createState() => _ContentsPageState();
}

class _ContentsPageState extends State<ContentsPage> {
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
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          ContentCard(
            title: "NFCタグを読み取る",
            iconData: Icons.nfc,
            onTap: () {},
          ),
          ContentCard(
              title: "QRコードを読み取る",
              iconData: Icons.qr_code,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CameraPage()));
              }),
          const Divider(),
          ContentCard(
              title: "整理券を確認する",
              iconData: Icons.confirmation_num_outlined,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TicketPage()));
              }),
        ],
      ),
    );
  }
}
