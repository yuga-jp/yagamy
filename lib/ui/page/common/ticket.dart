import 'package:flutter/material.dart';

import '../../widget/custom_widgets.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  TicketPageState createState() => TicketPageState();
}

class TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[ticketCard(context, 'お化け屋敷 整理券')],
        ),
      ),
    );
  }
}
