/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/intro_first.png
  AssetGenImage get introFirst =>
      const AssetGenImage('assets/images/intro_first.png');

  /// File path: assets/images/intro_second.png
  AssetGenImage get introSecond =>
      const AssetGenImage('assets/images/intro_second.png');

  /// File path: assets/images/intro_third.png
  AssetGenImage get introThird =>
      const AssetGenImage('assets/images/intro_third.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/server_head.png
  AssetGenImage get serverHead =>
      const AssetGenImage('assets/images/server_head.png');

  /// File path: assets/images/servers.png
  AssetGenImage get servers => const AssetGenImage('assets/images/servers.png');

  /// File path: assets/images/speed.png
  AssetGenImage get speed => const AssetGenImage('assets/images/speed.png');

  /// File path: assets/images/splash_background.png
  AssetGenImage get splashBackground =>
      const AssetGenImage('assets/images/splash_background.png');

  /// File path: assets/images/traffic.png
  AssetGenImage get traffic => const AssetGenImage('assets/images/traffic.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        introFirst,
        introSecond,
        introThird,
        logo,
        serverHead,
        servers,
        speed,
        splashBackground,
        traffic
      ];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/add.svg
  SvgGenImage get add => const SvgGenImage('assets/svgs/add.svg');

  /// File path: assets/svgs/back.svg
  SvgGenImage get back => const SvgGenImage('assets/svgs/back.svg');

  /// File path: assets/svgs/config_details.svg
  SvgGenImage get configDetails =>
      const SvgGenImage('assets/svgs/config_details.svg');

  /// File path: assets/svgs/config_page.svg
  SvgGenImage get configPage =>
      const SvgGenImage('assets/svgs/config_page.svg');

  /// File path: assets/svgs/connect_button.svg
  SvgGenImage get connectButton =>
      const SvgGenImage('assets/svgs/connect_button.svg');

  /// File path: assets/svgs/connection_time.svg
  SvgGenImage get connectionTime =>
      const SvgGenImage('assets/svgs/connection_time.svg');

  /// File path: assets/svgs/delete.svg
  SvgGenImage get delete => const SvgGenImage('assets/svgs/delete.svg');

  /// File path: assets/svgs/download.svg
  SvgGenImage get download => const SvgGenImage('assets/svgs/download.svg');

  /// File path: assets/svgs/edit.svg
  SvgGenImage get edit => const SvgGenImage('assets/svgs/edit.svg');

  /// File path: assets/svgs/filter.svg
  SvgGenImage get filter => const SvgGenImage('assets/svgs/filter.svg');

  /// File path: assets/svgs/ip.svg
  SvgGenImage get ip => const SvgGenImage('assets/svgs/ip.svg');

  /// File path: assets/svgs/location.svg
  SvgGenImage get location => const SvgGenImage('assets/svgs/location.svg');

  /// File path: assets/svgs/more_details.svg
  SvgGenImage get moreDetails =>
      const SvgGenImage('assets/svgs/more_details.svg');

  /// File path: assets/svgs/ping_reload.svg
  SvgGenImage get pingReload =>
      const SvgGenImage('assets/svgs/ping_reload.svg');

  /// File path: assets/svgs/run.svg
  SvgGenImage get run => const SvgGenImage('assets/svgs/run.svg');

  /// File path: assets/svgs/speed_test.svg
  SvgGenImage get speedTest => const SvgGenImage('assets/svgs/speed_test.svg');

  /// File path: assets/svgs/tap_to_check.svg
  SvgGenImage get tapToCheck =>
      const SvgGenImage('assets/svgs/tap_to_check.svg');

  /// File path: assets/svgs/trafic_page.svg
  SvgGenImage get traficPage =>
      const SvgGenImage('assets/svgs/trafic_page.svg');

  /// File path: assets/svgs/upload.svg
  SvgGenImage get upload => const SvgGenImage('assets/svgs/upload.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        add,
        back,
        configDetails,
        configPage,
        connectButton,
        connectionTime,
        delete,
        download,
        edit,
        filter,
        ip,
        location,
        moreDetails,
        pingReload,
        run,
        speedTest,
        tapToCheck,
        traficPage,
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

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

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
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
