/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  $LibSrcGen get src => const $LibSrcGen();
}

class $LibSrcGen {
  const $LibSrcGen();

  $LibSrcAssetsGen get assets => const $LibSrcAssetsGen();
  $LibSrcImagesGen get images => const $LibSrcImagesGen();
}

class $LibSrcAssetsGen {
  const $LibSrcAssetsGen();

  $LibSrcAssetsDarkCycleGen get darkCycle => const $LibSrcAssetsDarkCycleGen();
  $LibSrcAssetsLoverKissPngDatasetGen get loverKissPng =>
      const $LibSrcAssetsLoverKissPngDatasetGen();
}

class $LibSrcImagesGen {
  const $LibSrcImagesGen();

  $LibSrcImagesADotBurrGen get aDotBurr => const $LibSrcImagesADotBurrGen();
  $LibSrcImagesFlowerPinkGen get flowerPink =>
      const $LibSrcImagesFlowerPinkGen();
  $LibSrcImagesGirlButyGen get girlButy => const $LibSrcImagesGirlButyGen();
  $LibSrcImagesGirlCuteGen get girlCute => const $LibSrcImagesGirlCuteGen();
  $LibSrcImagesLoversCartnGen get loversCartn =>
      const $LibSrcImagesLoversCartnGen();
}

class $LibSrcAssetsDarkCycleGen {
  const $LibSrcAssetsDarkCycleGen();

  /// File path: lib/src/assets/dark_cycle/dark_cycle.png
  AssetGenImage get darkCycle =>
      const AssetGenImage('lib/src/assets/dark_cycle/dark_cycle.png');

  /// List of all assets
  List<AssetGenImage> get values => [darkCycle];
}

class $LibSrcAssetsLoverKissPngDatasetGen {
  const $LibSrcAssetsLoverKissPngDatasetGen();

  /// File path: lib/src/assets/lover_kiss.png.dataset/lover_kiss.json
  String get loverKissJson =>
      'lib/src/assets/lover_kiss.png.dataset/lover_kiss.json';

  /// File path: lib/src/assets/lover_kiss.png.dataset/lover_kiss.png
  AssetGenImage get loverKissPng => const AssetGenImage(
      'lib/src/assets/lover_kiss.png.dataset/lover_kiss.png');

  /// List of all assets
  List<dynamic> get values => [loverKissJson, loverKissPng];
}

class $LibSrcImagesADotBurrGen {
  const $LibSrcImagesADotBurrGen();

  /// File path: lib/src/images/a_dot_burr/a_dot_burr.png
  AssetGenImage get aDotBurr =>
      const AssetGenImage('lib/src/images/a_dot_burr/a_dot_burr.png');

  /// List of all assets
  List<AssetGenImage> get values => [aDotBurr];
}

class $LibSrcImagesFlowerPinkGen {
  const $LibSrcImagesFlowerPinkGen();

  /// File path: lib/src/images/flower_pink/flower_pink.png
  AssetGenImage get flowerPink =>
      const AssetGenImage('lib/src/images/flower_pink/flower_pink.png');

  /// List of all assets
  List<AssetGenImage> get values => [flowerPink];
}

class $LibSrcImagesGirlButyGen {
  const $LibSrcImagesGirlButyGen();

  /// File path: lib/src/images/girl_buty/girl_buty.png
  AssetGenImage get girlButy =>
      const AssetGenImage('lib/src/images/girl_buty/girl_buty.png');

  /// List of all assets
  List<AssetGenImage> get values => [girlButy];
}

class $LibSrcImagesGirlCuteGen {
  const $LibSrcImagesGirlCuteGen();

  /// File path: lib/src/images/girl_cute/girl_cute.png
  AssetGenImage get girlCute =>
      const AssetGenImage('lib/src/images/girl_cute/girl_cute.png');

  /// List of all assets
  List<AssetGenImage> get values => [girlCute];
}

class $LibSrcImagesLoversCartnGen {
  const $LibSrcImagesLoversCartnGen();

  /// File path: lib/src/images/lovers_cartn/lovers_cartn.png
  AssetGenImage get loversCartn =>
      const AssetGenImage('lib/src/images/lovers_cartn/lovers_cartn.png');

  /// List of all assets
  List<AssetGenImage> get values => [loversCartn];
}

class Assets {
  Assets._();

  static const $LibGen lib = $LibGen();
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
