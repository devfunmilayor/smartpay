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

class $AssetsFontsGen {
  const $AssetsFontsGen();
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/ic_bell.png
  AssetGenImage get icBell => const AssetGenImage('assets/png/ic_bell.png');

  /// File path: assets/png/ic_mail.png
  AssetGenImage get icMail => const AssetGenImage('assets/png/ic_mail.png');

  /// File path: assets/png/lock.png
  AssetGenImage get lock => const AssetGenImage('assets/png/lock.png');

  /// File path: assets/png/person.png
  AssetGenImage get person => const AssetGenImage('assets/png/person.png');

  /// File path: assets/png/thumbs.png
  AssetGenImage get thumbs => const AssetGenImage('assets/png/thumbs.png');

  /// File path: assets/png/user_photo.png
  AssetGenImage get userPhoto =>
      const AssetGenImage('assets/png/user_photo.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [icBell, icMail, lock, person, thumbs, userPhoto];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/app_arrow.svg
  SvgGenImage get appArrow => const SvgGenImage('assets/svg/app_arrow.svg');

  /// File path: assets/svg/apple.svg
  SvgGenImage get apple => const SvgGenImage('assets/svg/apple.svg');

  /// File path: assets/svg/google.svg
  SvgGenImage get google => const SvgGenImage('assets/svg/google.svg');

  /// File path: assets/svg/icon_cheveron_down.svg
  SvgGenImage get iconCheveronDown =>
      const SvgGenImage('assets/svg/icon_cheveron_down.svg');

  /// File path: assets/svg/intro_0.svg
  SvgGenImage get intro0 => const SvgGenImage('assets/svg/intro_0.svg');

  /// File path: assets/svg/intro_1.svg
  SvgGenImage get intro1 => const SvgGenImage('assets/svg/intro_1.svg');

  /// File path: assets/svg/lock.svg
  SvgGenImage get lock => const SvgGenImage('assets/svg/lock.svg');

  /// File path: assets/svg/smart_pay_logo.svg
  SvgGenImage get smartPayLogo =>
      const SvgGenImage('assets/svg/smart_pay_logo.svg');

  /// File path: assets/svg/thumbs_up.svg
  SvgGenImage get thumbsUp => const SvgGenImage('assets/svg/thumbs_up.svg');

  /// File path: assets/svg/tumbs.svg
  SvgGenImage get tumbs => const SvgGenImage('assets/svg/tumbs.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        appArrow,
        apple,
        google,
        iconCheveronDown,
        intro0,
        intro1,
        lock,
        smartPayLogo,
        thumbsUp,
        tumbs
      ];
}

class Assets {
  Assets._();

  static const String aEnv = '.env';
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

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
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
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
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
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
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
