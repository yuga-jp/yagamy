import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:yagamy/model/map_type.dart';
import 'package:yagamy/model/searcher_prop.dart';
import 'package:yagamy/repository/base_url.dart';
import 'package:yagamy/utility/get_image_url_end.dart';

class AreaImageRepository {
  static ImageProvider fetchAreaImage({
    SearcherProp? searcherProp,
    MapType? mapType,
  }) {
    return CachedNetworkImageProvider(
      '${BaseUrl.awsBaseUrl}/${getImageUrlEnd(searcherProp, mapType)}',
    );
  }
}
