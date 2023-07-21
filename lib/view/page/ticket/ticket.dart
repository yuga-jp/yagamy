import 'package:flutter/material.dart';

import 'package:yagamy/view/common/ui_part/ticket_card.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
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
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          children: <Widget>[TicketCard(title: 'お化け屋敷 整理券')],
        ),
      ),
    );
  }
}
