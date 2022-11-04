library dice_bear;

import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

part 'utils.dart';

///
/// Builder for [Avatar]
class DiceBearBuilder {
  final DiceBearSprite sprite;
  late final String seed;
  final Color? backgroundColor;
  final int radius;
  final int? size;
  final int scale;
  final bool flip;
  final int rotate;
  final int translateX;
  final int translateY;

  static const DiceBearSprite _defaultSprite = DiceBearSprite.any;
  static const String _defaultSeed = '';
  static const int _defaultRadius = 0;
  static const int _defaultScale = 100;
  static const bool _defaultFlip = false;
  static const int _defaultRotate = 0;
  static const int _defaultTranslateX = 0;
  static const int _defaultTranslateY = 0;

  DiceBearBuilder({
    this.sprite = _defaultSprite,
    this.seed = _defaultSeed,
    this.backgroundColor,
    this.radius = _defaultRadius,
    this.size,
    this.scale = _defaultScale,
    this.flip = _defaultFlip,
    this.rotate = _defaultRotate,
    this.translateX = _defaultTranslateX,
    this.translateY = _defaultTranslateY,
  }) {
    assert(radius >= 0 && radius <= 50);
    assert(size == null || size! >= 1);
    assert(scale >= 0 && scale <= 200);
    assert(rotate >= 0 && rotate <= 360);
    assert(translateX >= -100 && translateX <= 100);
    assert(translateY >= -100 && translateY <= 100);
  }

  DiceBearBuilder.withRandomSeed({
    this.sprite = _defaultSprite,
    this.backgroundColor,
    this.radius = _defaultRadius,
    this.size,
    this.scale = _defaultScale,
    this.flip = _defaultFlip,
    this.rotate = _defaultRotate,
    this.translateX = _defaultTranslateX,
    this.translateY = _defaultTranslateY,
  }) {
    assert(radius >= 0 && radius <= 50);
    assert(size == null || size! >= 1);
    assert(scale >= 0 && scale <= 200);
    assert(rotate >= 0 && rotate <= 360);
    assert(translateX >= -100 && translateX <= 100);
    assert(translateY >= -100 && translateY <= 100);

    seed = _randomString();
  }

  ///
  /// Generates a [Avatar] object.
  ///
  /// Try [DiceBear Avatars](https://avatars.dicebear.com/)
  /// to test with different sprites and options.
  ///
  /// <hr/>
  /// <h3>LICENSE INFO<h3/>
  /// Please check the
  /// [design licenses](https://avatars.dicebear.com/licenses) before use
  Avatar build() {
    Map<String, String> params = {
      'seed': seed,
    };

    if (backgroundColor != null) {
      params['backgroundColor'] =
          backgroundColor!.toHexTriplet().replaceFirst("#", "");
    }
    if (radius != _defaultRadius) {
      params['radius'] = radius.toString();
    }
    if (size != null) {
      params['size'] = size.toString();
    }
    if (scale != _defaultScale) {
      params['scale'] = scale.toString();
    }
    if (flip != _defaultFlip) {
      params['flip'] = flip.toString();
    }
    if (rotate != _defaultRotate) {
      params['rotate'] = rotate.toString();
    }
    if (translateX != _defaultTranslateX) {
      params['translateX'] = translateX.toString();
    }
    if (translateY != _defaultTranslateY) {
      params['translateY'] = translateY.toString();
    }

    Uri svgUri = Uri.https(
      _diceBearHost,
      "/$_diceBearApiVersion/${sprite.value}/svg",
      params,
    );

    return Avatar._(svgUri);
  }
}

///
/// A DiceBear avatar object that can be used to download the avatar in
/// raw SVG bytes ([Uint8List]) or show a widget image of the avatar on
/// screen
class Avatar {
  ///
  /// [svgUri] is the generated URL for DiceBear API that should return the
  /// right avatar
  final Uri svgUri;

  Avatar._(this.svgUri);

  ///
  /// Uses [http] to download the SVG image and returns raw SVG bytes
  ///
  /// Returns [null] when it fails to download the image
  Future<Uint8List?> asRawSvgBytes() async {
    try {
      Response response = await http.get(svgUri);
      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        throw Exception(
          'response code is ${response.statusCode} with message ${response.body}',
        );
      }
    } catch (e, stackTrace) {
      debugPrintStack(
        stackTrace: stackTrace,
        label: 'Error occurred in rawSvg()',
      );
      return null;
    }
  }

  ///
  /// Generates a widget using [SvgPicture.network].
  ///
  /// Also see [flutter_svg](https://pub.dev/packages/flutter_svg) package
  ///
  /// <hr/>
  /// <h3>Copied documentation from [SvgPicture.network] :</h3>
  ///
  /// Creates a widget that displays a [PictureStream] obtained from the network.
  ///
  /// The [url] argument must not be null.
  ///
  /// Either the [width] and [height] arguments should be specified, or the
  /// widget should be placed in a context that sets tight layout constraints.
  /// Otherwise, the image dimensions will change as the image is loaded, which
  /// will result in ugly layout changes.
  ///
  /// If `matchTextDirection` is set to true, the picture will be flipped
  /// horizontally in [TextDirection.rtl] contexts.
  ///
  /// The `allowDrawingOutsideOfViewBox` parameter should be used with caution -
  /// if set to true, it will not clip the canvas used internally to the view box,
  /// meaning the picture may draw beyond the intended area and lead to undefined
  /// behavior or additional memory overhead.
  ///
  /// A custom `placeholderBuilder` can be specified for cases where decoding or
  /// acquiring data may take a noticeably long time, such as high latency scenarios.
  ///
  /// The `color` and `colorBlendMode` arguments, if specified, will be used to set a
  /// [ColorFilter] on any [Paint]s created for this drawing.
  ///
  /// The `theme` argument, if provided, will override the default theme
  /// used when parsing SVG elements.
  ///
  /// All network images are cached regardless of HTTP headers.
  ///
  /// An optional `headers` argument can be used to send custom HTTP headers
  /// with the image request.
  ///
  /// If [excludeFromSemantics] is true, then [semanticLabel] will be ignored.
  Widget toImage({
    Key? key,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    bool matchTextDirection = false,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.network(
      svgUri.toString(),
      key: key,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      matchTextDirection: matchTextDirection,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is Avatar) {
      return svgUri.toString() == other.svgUri.toString();
    } else {
      return this == other;
    }
  }

  @override
  int get hashCode {
    return svgUri.toString().hashCode;
  }
}

///
/// See all styles [here](https://avatars.dicebear.com/styles)
///
/// [DiceBearSprite.any] sets a random [DiceBearSprite] when
/// using [DiceBearBuilder]
enum DiceBearSprite {
  any,
  adventurer,
  adventurerNeutral,
  avataaars,
  bigEars,
  bigEarsNeutral,
  bigSmile,
  bottts,
  croodles,
  croodlesNeutral,
  identicon,
  @Deprecated(
    "avatar.toImage() will crash because of an issue with flutter_svg. See dnfield/flutter_svg issue #559 on GitHub",
  ) // Remove the deprecation check from _randomDiceBearSprite() too
  initials,
  micah,
  miniavs,
  openPeeps,
  personas,
  pixelArt,
  pixelArtNeutral,
}
