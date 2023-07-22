import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    Key? key,
    required this.title,
    required this.iconData,
    this.onTap,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.outline),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      margin: const EdgeInsets.only(left: 10, right: 10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 100,
          child: Row(
            children: <Widget>[
              SizedBox(
                  width: 80, child: Center(child: Icon(iconData, size: 45))),
              const SizedBox(width: 5),
              Expanded(
                  child: Center(
                      child:
                          Text(title, style: const TextStyle(fontSize: 24)))),
              const SizedBox(width: 50),
            ],
          ),
        ),
      ),
    );
  }
}
