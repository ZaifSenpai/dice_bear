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
  final DiceBearSprites sprite;
  final String? seed;
  final DiceBearMoods? mood;
  final Color? background;
  final int radius;
  final int? size;
  final int scale;
  final bool flip;
  final int rotate;
  final int translateX;
  final int translateY;

  DiceBearBuilder({
    required this.sprite,
    this.seed,
    this.mood,
    this.background,
    this.radius = 0,
    this.size,
    this.scale = 100,
    this.flip = false,
    this.rotate = 0,
    this.translateX = 0,
    this.translateY = 0,
  }) {
    assert(radius >= 0 && radius <= 50);
    assert(size == null || size! >= 1);
    assert(scale >= 0 && scale <= 200);
    assert(rotate >= 0 && rotate <= 360);
    assert(translateX >= -100 && translateX <= 100);
    assert(translateY >= -100 && translateY <= 100);
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
    Map<String, String> params = {};

    if (mood != null) {
      params['mood'] = mood!.value;
    }
    if (background != null) {
      params['background'] =
          background!.toHexTriplet().replaceFirst("#", "%23");
    }
    params['radius'] = radius.toString();
    if (size != null) {
      params['size'] = size.toString();
    }
    params['scale'] = scale.toString();
    params['flip'] = flip.toString();
    params['rotate'] = rotate.toString();
    params['translateX'] = translateX.toString();
    params['translateY'] = translateY.toString();

    Uri svgUri = Uri.https(
      _diceBearHost,
      "/api/${sprite.value}/${seed ?? _randomString()}.svg",
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
  /// <h2>KNOWN ISSUE:</h2>
  /// There is an issue with [SvgPicture.network] that does not correctly show
  /// some images. I have reported this issue
  /// [here](https://github.com/dnfield/flutter_svg/issues/641).
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
  @Deprecated(
    "There is an issue with [SvgPicture.network] that does not correctly show some images.",
  )
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
/// [DiceBearSprites.any] sets a random [DiceBearSprites] when
/// using [DiceBearBuilder]
enum DiceBearSprites {
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
  initials,
  micah,
  miniavs,
  openPeeps,
  personas,
  pixelArt,
  pixelArtNeutral,
}

///
/// Returns moods for DiceBear
///
/// [DiceBearMoods.any] sets a random [DiceBearMoods] when
/// using [DiceBearBuilder]
enum DiceBearMoods {
  any,
  happy,
  sad,
  surprised,
}
