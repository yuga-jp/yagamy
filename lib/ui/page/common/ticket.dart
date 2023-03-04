import 'package:flutter/material.dart';

import 'package:yagamy/ui/widget/card/ticket_card.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: const <Widget>[TicketCard(title: 'お化け屋敷 整理券')],
        ),
      ),
    );
  }
}
