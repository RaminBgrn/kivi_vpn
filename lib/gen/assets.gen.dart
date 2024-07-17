/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/intro_first.png
  AssetGenImage get introFirst =>
      const AssetGenImage('assets/images/intro_first.png');

  /// File path: assets/images/intro_secound.png
  AssetGenImage get introSecound =>
      const AssetGenImage('assets/images/intro_secound.png');

  /// File path: assets/images/intro_third.png
  AssetGenImage get introThird =>
      const AssetGenImage('assets/images/intro_third.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/splash_background.png
  AssetGenImage get splashBackground =>
      const AssetGenImage('assets/images/splash_background.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [introFirst, introSecound, introThird, logo, splashBackground];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/back.svg
  String get back => 'assets/svgs/back.svg';

  /// File path: assets/svgs/config_details.svg
  String get configDetails => 'assets/svgs/config_details.svg';

  /// File path: assets/svgs/connect_button.svg
  String get connectButton => 'assets/svgs/connect_button.svg';

  /// File path: assets/svgs/connection_time.svg
  String get connectionTime => 'assets/svgs/connection_time.svg';

  /// File path: assets/svgs/download.svg
  String get download => 'assets/svgs/download.svg';

  /// File path: assets/svgs/ip.svg
  String get ip => 'assets/svgs/ip.svg';

  /// File path: assets/svgs/location.svg
  String get location => 'assets/svgs/location.svg';

  /// File path: assets/svgs/more_details.svg
  String get moreDetails => 'assets/svgs/more_details.svg';

  /// File path: assets/svgs/ping_reload.svg
  String get pingReload => 'assets/svgs/ping_reload.svg';

  /// File path: assets/svgs/tap_to_check.svg
  String get tapToCheck => 'assets/svgs/tap_to_check.svg';

  /// File path: assets/svgs/upload.svg
  String get upload => 'assets/svgs/upload.svg';

  /// List of all assets
  List<String> get values => [
        back,
        configDetails,
        connectButton,
        connectionTime,
        download,
        ip,
        location,
        moreDetails,
        pingReload,
        tapToCheck,
        upload
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
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
