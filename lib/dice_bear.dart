library dice_bear;

import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

part 'utils.dart';

///
/// Try [DiceBear Avatars](https://avatars.dicebear.com/)
/// to test with different sprites and options.
///
/// Please check the
/// [design licenses](https://avatars.dicebear.com/licenses) before use
DiceBearAvatar generateDiceBearAvatar({
  required DiceBearSprites sprite,
  String? seed,
  DiceBearMoods? mood,
  Color? background,
  int radius = 0,
  int? size,
  int scale = 100,
  bool flip = false,
  int rotate = 0,
  int translateX = 0,
  int translateY = 0,
}) {
  assert(radius >= 0 && radius <= 50);
  assert(size == null || size >= 1);
  assert(scale >= 0 && scale <= 200);
  assert(rotate >= 0 && rotate <= 360);
  assert(translateX >= -100 && translateX <= 100);
  assert(translateY >= -100 && translateY <= 100);

  Map<String, String> params = {};

  if (mood != null) {
    params['mood'] = mood.value;
  }
  if (background != null) {
    params['background'] = background.toHexTriplet().replaceFirst("#", "%23");
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

  return DiceBearAvatar(svgUri);
}

class DiceBearAvatar {
  final Uri svgUri;

  DiceBearAvatar(this.svgUri);

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
}

///
/// See all styles [here](https://avatars.dicebear.com/styles)
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

enum DiceBearMoods {
  any,
  happy,
  sad,
  surprised,
}
