/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/icon_1024x1024.png
  AssetGenImage get icon1024x1024 =>
      const AssetGenImage('assets/icon/icon_1024x1024.png');

  /// List of all assets
  List<AssetGenImage> get values => [icon1024x1024];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/x_twitter.svg
  SvgGenImage get xTwitter => const SvgGenImage('assets/logo/x_twitter.svg');

  /// File path: assets/logo/yagami_festival_2023.svg
  SvgGenImage get yagamiFestival2023 =>
      const SvgGenImage('assets/logo/yagami_festival_2023.svg');

  /// List of all assets
  List<SvgGenImage> get values => [xTwitter, yagamiFestival2023];
}

class $AssetsMapGen {
  const $AssetsMapGen();

  /// File path: assets/map/aed.svg
  SvgGenImage get aed => const SvgGenImage('assets/map/aed.svg');

  /// File path: assets/map/booth_headquarter.svg
  SvgGenImage get boothHeadquarter =>
      const SvgGenImage('assets/map/booth_headquarter.svg');

  /// File path: assets/map/elevator.svg
  SvgGenImage get elevator => const SvgGenImage('assets/map/elevator.svg');

  /// File path: assets/map/headquarter.svg
  SvgGenImage get headquarter =>
      const SvgGenImage('assets/map/headquarter.svg');

  /// File path: assets/map/information_center.svg
  SvgGenImage get informationCenter =>
      const SvgGenImage('assets/map/information_center.svg');

  /// File path: assets/map/outdoor_rest_area.svg
  SvgGenImage get outdoorRestArea =>
      const SvgGenImage('assets/map/outdoor_rest_area.svg');

  /// File path: assets/map/pin_data.json
  String get pinData => 'assets/map/pin_data.json';

  /// File path: assets/map/public_phone.svg
  SvgGenImage get publicPhone =>
      const SvgGenImage('assets/map/public_phone.svg');

  /// File path: assets/map/restroom.svg
  SvgGenImage get restroom => const SvgGenImage('assets/map/restroom.svg');

  /// File path: assets/map/restroom_men.svg
  SvgGenImage get restroomMen =>
      const SvgGenImage('assets/map/restroom_men.svg');

  /// File path: assets/map/restroom_women.svg
  SvgGenImage get restroomWomen =>
      const SvgGenImage('assets/map/restroom_women.svg');

  /// File path: assets/map/security_office.svg
  SvgGenImage get securityOffice =>
      const SvgGenImage('assets/map/security_office.svg');

  /// File path: assets/map/trash_can.svg
  SvgGenImage get trashCan => const SvgGenImage('assets/map/trash_can.svg');

  /// File path: assets/map/whole_area_map.svg
  SvgGenImage get wholeAreaMap =>
      const SvgGenImage('assets/map/whole_area_map.svg');

  /// List of all assets
  List<dynamic> get values => [
        aed,
        boothHeadquarter,
        elevator,
        headquarter,
        informationCenter,
        outdoorRestArea,
        pinData,
        publicPhone,
        restroom,
        restroomMen,
        restroomWomen,
        securityOffice,
        trashCan,
        wholeAreaMap
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
  static const $AssetsMapGen map = $AssetsMapGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
