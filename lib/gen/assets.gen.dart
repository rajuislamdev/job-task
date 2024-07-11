/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/bell.png
  AssetGenImage get bell => const AssetGenImage('assets/png/bell.png');

  /// File path: assets/png/demo.png
  AssetGenImage get demo => const AssetGenImage('assets/png/demo.png');

  /// File path: assets/png/person.png
  AssetGenImage get person => const AssetGenImage('assets/png/person.png');

  /// List of all assets
  List<AssetGenImage> get values => [bell, demo, person];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/calender.svg
  String get calender => 'assets/svg/calender.svg';

  /// File path: assets/svg/camera.svg
  String get camera => 'assets/svg/camera.svg';

  /// File path: assets/svg/data.svg
  String get data => 'assets/svg/data.svg';

  /// File path: assets/svg/demo.svg
  String get demo => 'assets/svg/demo.svg';

  /// File path: assets/svg/document.svg
  String get document => 'assets/svg/document.svg';

  /// File path: assets/svg/home.svg
  String get home => 'assets/svg/home.svg';

  /// File path: assets/svg/location_pin.svg
  String get locationPin => 'assets/svg/location_pin.svg';

  /// File path: assets/svg/man.svg
  String get man => 'assets/svg/man.svg';

  /// File path: assets/svg/menu.svg
  String get menu => 'assets/svg/menu.svg';

  /// File path: assets/svg/property.svg
  String get property => 'assets/svg/property.svg';

  /// File path: assets/svg/sit.svg
  String get sit => 'assets/svg/sit.svg';

  /// List of all assets
  List<String> get values => [
        calender,
        camera,
        data,
        demo,
        document,
        home,
        locationPin,
        man,
        menu,
        property,
        sit
      ];
}

class Assets {
  Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
