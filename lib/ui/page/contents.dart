import 'package:flutter/material.dart';

import './common/camera.dart';
import './common/ticket.dart';
import '../widget/custom_widgets.dart';

class ContentsPage extends StatefulWidget {
  const ContentsPage({Key? key}) : super(key: key);

  @override
  ContentsPageState createState() => ContentsPageState();
}

class ContentsPageState extends State<ContentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[Icon(Icons.info_outline), SizedBox(width: 15)],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            contentCard(context, "NFCタグを読み取る", Icons.nfc, () {}),
            contentCard(context, "QRコードを読み取る", Icons.qr_code, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CameraPage()));
            }),
            const Divider(),
            contentCard(context, "整理券を確認する", Icons.confirmation_num_outlined,
                () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TicketPage()));
            })
          ],
        ),
      ),
    );
  }
}
