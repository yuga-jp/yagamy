import 'package:flutter/material.dart';

class ProjectInfoBodyLoading extends StatelessWidget {
  const ProjectInfoBodyLoading({super.key});

  static const Color emptyColor = Colors.grey;

  static const double horizontalIndent = 15;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: horizontalIndent, top: 12, right: 100, bottom: 5),
          child: Container(
            decoration: BoxDecoration(
              color: emptyColor,
              borderRadius: BorderRadius.circular(4),
            ),
            height: 35,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: horizontalIndent, top: 5, right: 50, bottom: 5),
          child: Container(
            decoration: BoxDecoration(
              color: emptyColor,
              borderRadius: BorderRadius.circular(4),
            ),
            height: 20,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: emptyColor,
            borderRadius: BorderRadius.circular(15),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 3 / 4,
          margin: const EdgeInsets.only(
            left: 7,
            top: 8,
            right: 7,
            bottom: 12,
          ),
          clipBehavior: Clip.antiAlias,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: horizontalIndent,
            top: 3,
            right: 100,
            bottom: 3,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: emptyColor,
              borderRadius: BorderRadius.circular(4),
            ),
            height: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            top: 3,
            right: 30,
            bottom: 3,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: emptyColor,
              borderRadius: BorderRadius.circular(4),
            ),
            height: 40,
          ),
        ),
        const Divider(
          height: 10,
          indent: horizontalIndent,
          endIndent: horizontalIndent,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: horizontalIndent,
            top: 10,
            right: horizontalIndent,
            bottom: 18,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: emptyColor,
              borderRadius: BorderRadius.circular(4),
            ),
            height: 200,
          ),
        ),
      ],
    );
  }
}
