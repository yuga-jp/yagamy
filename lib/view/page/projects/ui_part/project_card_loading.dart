import 'package:flutter/material.dart';
import 'package:yagamy/constant/theme/project_card_theme.dart';

class ProjectCardLoading extends StatelessWidget {
  const ProjectCardLoading({
    super.key,
  });

  final Color emptyColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      margin: const EdgeInsets.only(left: 10, top: 4, right: 10, bottom: 4),
      child: SizedBox(
        height: 110,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: emptyColor,
                  border: Border.all(
                    color:
                        Theme.of(context).extension<ProjectCardTheme>()!.color!,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              width: 110,
              height: 110,
            ),
            const SizedBox(width: 7),
            SizedBox(
              height: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 7),
                  Container(
                    decoration: BoxDecoration(
                      color: emptyColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    width: 200,
                    height: 25,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: emptyColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    width: 125,
                    height: 22,
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: emptyColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        width: 100,
                        height: 20,
                      ),
                      const SizedBox(width: 35),
                      Container(
                        decoration: BoxDecoration(
                          color: emptyColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        width: 100,
                        height: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
