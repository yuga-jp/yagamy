import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    Key? key,
    required this.title,
    this.ticketNumber,
  }) : super(key: key);

  final String title;
  final int? ticketNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.outline),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: 350,
        height: 400,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(title, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 30),
            Text(ticketNumber.toString(), style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
