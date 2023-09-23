import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yagamy/constant/theme/project_card_theme.dart';
import 'package:yagamy/extension/sale_situation_type_extension.dart';
import 'package:yagamy/extension/string_extension.dart';
import 'package:yagamy/model/project/project_for_card.dart';
import 'package:yagamy/model/sale_siituation_type.dart';
import 'package:yagamy/model/sale_situation/sale_situation.dart';
import 'package:yagamy/provider/sale_situation_provider.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.project,
    this.onTap,
  }) : super(key: key);

  final ProjectForCard project;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Card(
        color: Theme.of(context).extension<ProjectCardTheme>()!.color!,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.outline),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        margin: const EdgeInsets.only(left: 10, top: 4, right: 10, bottom: 4),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 110,
            child: Row(
              children: <Widget>[
                _ProjectImage(project.thumbnailUrl),
                Flexible(
                  child: _ProjectInfo(
                    project.title,
                    project.groupName,
                    project.placeString,
                    project.hoursString,
                    project.id,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProjectImage extends StatelessWidget {
  const _ProjectImage(this.imageUrl);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(imageUrl),
            fit: BoxFit.contain,
          ),
          border: Border.all(
            color: Theme.of(context).extension<ProjectCardTheme>()!.color!,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(15)),
      width: 110,
      height: 110,
    );
  }
}

class _ProjectInfo extends ConsumerWidget {
  const _ProjectInfo(
    this.title,
    this.groupName,
    this.placeName,
    this.time,
    this.id,
  );

  final String title;
  final String groupName;
  final String placeName;
  final String time;
  final String id;

  Widget _projectPlace(String place, Color textColor) {
    return SizedBox(
      width: 135,
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined, size: 17),
          Text(place,
              style: TextStyle(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }

  Widget _projectTime(String time, Color textColor) {
    return SizedBox(
      child: Row(
        children: [
          const Icon(Icons.schedule, size: 17),
          Text(time,
              style: TextStyle(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }

  Color saleSituationColor(SaleSituationType saleSituationType) {
    switch (saleSituationType) {
      case SaleSituationType.onSale:
        return Colors.green;
      case SaleSituationType.limited:
        return Colors.red;
      case SaleSituationType.unavailable:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProjectCardTheme currentTheme =
        Theme.of(context).extension<ProjectCardTheme>()!;

    final AsyncValue<SaleSituation> saleSituation =
        ref.watch(saleSituationProvider(id));

    return Container(
      padding: const EdgeInsets.only(left: 7, top: 7, right: 7, bottom: 5),
      height: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Icon(Icons.group_outlined,
                  size: 17, color: currentTheme.groupDisplayColor!),
              Flexible(
                child: Text(
                  groupName,
                  style: TextStyle(
                    color: currentTheme.groupDisplayColor!,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          saleSituation.when(
            loading: () {
              return const SizedBox.shrink();
            },
            error: (error, stackTrace) {
              return const SizedBox.shrink();
            },
            data: (saleSituation) {
              return Text(
                saleSituation.saleSituation.toSaleSituationType()!.toJpString(),
                style: TextStyle(
                  color: saleSituationColor(
                      saleSituation.saleSituation.toSaleSituationType()!),
                  fontSize: 14,
                ),
              );
            },
          ),
          const Expanded(child: SizedBox()),
          Row(
            children: <Widget>[
              _projectPlace(placeName, currentTheme.textColor!),
              _projectTime(time, currentTheme.textColor!),
            ],
          ),
        ],
      ),
    );
  }
}
