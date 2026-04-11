library dice_bear;

import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

part 'src/style_options/character_style_options.dart';
part 'src/style_options/adventurer_neutral_options.dart';
part 'src/style_options/adventurer_options.dart';
part 'src/style_options/avataaars_neutral_options.dart';
part 'src/style_options/avataaars_options.dart';
part 'src/style_options/big_ears_neutral_options.dart';
part 'src/style_options/big_ears_options.dart';
part 'src/style_options/big_smile_options.dart';
part 'src/style_options/bottts_neutral_options.dart';
part 'src/style_options/bottts_options.dart';
part 'src/style_options/croodles_neutral_options.dart';
part 'src/style_options/croodles_options.dart';
part 'src/style_options/dylan_options.dart';
part 'src/style_options/fun_emoji_options.dart';
part 'src/style_options/glass_options.dart';
part 'src/style_options/icons_options.dart';
part 'src/style_options/identicon_options.dart';
part 'src/style_options/initials_options.dart';
part 'src/style_options/lorelei_neutral_options.dart';
part 'src/style_options/lorelei_options.dart';
part 'src/style_options/micah_options.dart';
part 'src/style_options/miniavs_options.dart';
part 'src/style_options/notionists_neutral_options.dart';
part 'src/style_options/notionists_options.dart';
part 'src/style_options/open_peeps_options.dart';
part 'src/style_options/personas_options.dart';
part 'src/style_options/pixel_art_neutral_options.dart';
part 'src/style_options/pixel_art_options.dart';
part 'src/style_options/rings_options.dart';
part 'src/style_options/shapes_options.dart';
part 'src/style_options/thumbs_options.dart';
part 'src/style_options/toon_head_options.dart';

const String _diceBearHost = 'api.dicebear.com';
const String _diceBearApiVersion = '9.x';
final RegExp _hexColorWithoutHash = RegExp(r'^[a-fA-F0-9]{6}$');

/// Supported output formats for DiceBear HTTP API v9.
enum DiceBearFormat {
  /// Image format svg
  svg,

  /// Image format png
  png,

  /// Image format jpeg
  jpg,

  /// Image format webp
  webp,

  /// Image format avif
  avif,

  /// Image format json
  json,
}

extension _DiceBearFormatX on DiceBearFormat {
  String get value {
    switch (this) {
      case DiceBearFormat.svg:
        return 'svg';
      case DiceBearFormat.png:
        return 'png';
      case DiceBearFormat.jpg:
        return 'jpg';
      case DiceBearFormat.webp:
        return 'webp';
      case DiceBearFormat.avif:
        return 'avif';
      case DiceBearFormat.json:
        return 'json';
    }
  }

  bool get isSvg => this == DiceBearFormat.svg;
}

/// See all styles: https://www.dicebear.com/styles/
enum DiceBearStyle {
  /// Random style, resolved client-side before URL generation.
  random,

  /// DiceBear Style [Adventurer](https://www.dicebear.com/styles/adventurer)
  adventurer,

  /// DiceBear Style [Adventurer Neutral](https://www.dicebear.com/styles/adventurerNeutral)
  adventurerNeutral,

  /// DiceBear Style [Avataaars](https://www.dicebear.com/styles/avataaars)
  avataaars,

  /// DiceBear Style [Avataaars Neutral](https://www.dicebear.com/styles/avataaarsNeutral)
  avataaarsNeutral,

  /// DiceBear Style [Big Ears](https://www.dicebear.com/styles/bigEars)
  bigEars,

  /// DiceBear Style [Big Ears Neutral](https://www.dicebear.com/styles/bigEarsNeutral)
  bigEarsNeutral,

  /// DiceBear Style [Big Smile](https://www.dicebear.com/styles/bigSmile)
  bigSmile,

  /// DiceBear Style [Bottts](https://www.dicebear.com/styles/bottts)
  bottts,

  /// DiceBear Style [Bottts Neutral](https://www.dicebear.com/styles/botttsNeutral)
  botttsNeutral,

  /// DiceBear Style [Croodles](https://www.dicebear.com/styles/croodles)
  croodles,

  /// DiceBear Style [Croodles Neutral](https://www.dicebear.com/styles/croodlesNeutral)
  croodlesNeutral,

  /// DiceBear Style [Dylan](https://www.dicebear.com/styles/dylan)
  dylan,

  /// DiceBear Style [Fun Emoji](https://www.dicebear.com/styles/funEmoji)
  funEmoji,

  /// DiceBear Style [Glass](https://www.dicebear.com/styles/glass)
  glass,

  /// DiceBear Style [Icons](https://www.dicebear.com/styles/icons)
  icons,

  /// DiceBear Style [Identicon](https://www.dicebear.com/styles/identicon)
  identicon,

  /// DiceBear Style [Initials](https://www.dicebear.com/styles/initials)
  initials,

  /// DiceBear Style [Lorelei](https://www.dicebear.com/styles/lorelei)
  lorelei,

  /// DiceBear Style [Lorelei Neutral](https://www.dicebear.com/styles/loreleiNeutral)
  loreleiNeutral,

  /// DiceBear Style [Micah](https://www.dicebear.com/styles/micah)
  micah,

  /// DiceBear Style [Miniavs](https://www.dicebear.com/styles/miniavs)
  miniavs,

  /// DiceBear Style [Notionists](https://www.dicebear.com/styles/notionists)
  notionists,

  /// DiceBear Style [Notionists Neutral](https://www.dicebear.com/styles/notionistsNeutral)
  notionistsNeutral,

  /// DiceBear Style [Open Peeps](https://www.dicebear.com/styles/openPeeps)
  openPeeps,

  /// DiceBear Style [Personas](https://www.dicebear.com/styles/personas)
  personas,

  /// DiceBear Style [Pixel Art](https://www.dicebear.com/styles/pixelArt)
  pixelArt,

  /// DiceBear Style [Pixel Art Neutral](https://www.dicebear.com/styles/pixelArtNeutral)
  pixelArtNeutral,

  /// DiceBear Style [Rings](https://www.dicebear.com/styles/rings)
  rings,

  /// DiceBear Style [Shapes](https://www.dicebear.com/styles/shapes)
  shapes,

  /// DiceBear Style [Thumbs](https://www.dicebear.com/styles/thumbs)
  thumbs,

  /// DiceBear Style [Toon Head](https://www.dicebear.com/styles/toonHead)
  toonHead,
}

extension _DiceBearStyleX on DiceBearStyle {
  String get value {
    switch (this) {
      case DiceBearStyle.adventurer:
        return 'adventurer';
      case DiceBearStyle.adventurerNeutral:
        return 'adventurer-neutral';
      case DiceBearStyle.avataaars:
        return 'avataaars';
      case DiceBearStyle.avataaarsNeutral:
        return 'avataaars-neutral';
      case DiceBearStyle.bigEars:
        return 'big-ears';
      case DiceBearStyle.bigEarsNeutral:
        return 'big-ears-neutral';
      case DiceBearStyle.bigSmile:
        return 'big-smile';
      case DiceBearStyle.bottts:
        return 'bottts';
      case DiceBearStyle.botttsNeutral:
        return 'bottts-neutral';
      case DiceBearStyle.croodles:
        return 'croodles';
      case DiceBearStyle.croodlesNeutral:
        return 'croodles-neutral';
      case DiceBearStyle.dylan:
        return 'dylan';
      case DiceBearStyle.funEmoji:
        return 'fun-emoji';
      case DiceBearStyle.glass:
        return 'glass';
      case DiceBearStyle.icons:
        return 'icons';
      case DiceBearStyle.identicon:
        return 'identicon';
      case DiceBearStyle.initials:
        return 'initials';
      case DiceBearStyle.lorelei:
        return 'lorelei';
      case DiceBearStyle.loreleiNeutral:
        return 'lorelei-neutral';
      case DiceBearStyle.micah:
        return 'micah';
      case DiceBearStyle.miniavs:
        return 'miniavs';
      case DiceBearStyle.notionists:
        return 'notionists';
      case DiceBearStyle.notionistsNeutral:
        return 'notionists-neutral';
      case DiceBearStyle.openPeeps:
        return 'open-peeps';
      case DiceBearStyle.personas:
        return 'personas';
      case DiceBearStyle.pixelArt:
        return 'pixel-art';
      case DiceBearStyle.pixelArtNeutral:
        return 'pixel-art-neutral';
      case DiceBearStyle.rings:
        return 'rings';
      case DiceBearStyle.shapes:
        return 'shapes';
      case DiceBearStyle.thumbs:
        return 'thumbs';
      case DiceBearStyle.toonHead:
        return 'toon-head';
      case DiceBearStyle.random:
        return DiceBearStyleRandom.randomStyle().value;
    }
  }

  bool get isRandom => this == DiceBearStyle.random;
}

extension _ColorX on Color {
  String toDiceBearHex() {
    final rgb = toARGB32() & 0xFFFFFF;
    return rgb.toRadixString(16).padLeft(6, '0').toLowerCase();
  }
}

/// Background types for DiceBear image. Possible values: `solid` (Default) and `gradientLinear`
enum DiceBearBackgroundType {
  /// Set background to a solid color. Provide `backgroundColor` option to customize.
  solid,

  /// Background type gradient. Provide `backgroundColor` option to customize gradient.
  gradientLinear,
}

extension _DiceBearBackgroundTypeX on DiceBearBackgroundType {
  String get value {
    switch (this) {
      case DiceBearBackgroundType.solid:
        return 'solid';
      case DiceBearBackgroundType.gradientLinear:
        return 'gradientLinear';
    }
  }
}

/// Shared base for style-specific options.
abstract class DiceBearStyleOptions {
  /// Convert all options to URL query parameters
  Map<String, String> toQueryParameters();
}

/// Pass custom style options as raw query parameters.
class DiceBearRawStyleOptions implements DiceBearStyleOptions {
  final Map<String, dynamic> values;

  const DiceBearRawStyleOptions(this.values);

  @override
  Map<String, String> toQueryParameters() {
    values.forEach((key, value) {
      if (value == null) {
        return;
      }

      if (value is List) {
        _validateStringArray(
            name: key,
            values: value.whereType<String>().toList(growable: false));
      }
    });

    return _serializeMap(values);
  }
}

/// Core options available across all DiceBear styles in v9.
class DiceBearCoreOptions {
  final String? seed;
  final bool? flip;
  final int? rotate;
  final int? scale;
  final int? radius;
  final int? size;

  /// Background colors (hex without #, or "transparent")
  final List<String>? backgroundColor;
  final List<DiceBearBackgroundType>? backgroundType;
  final List<int>? backgroundRotation;
  final int? translateX;
  final int? translateY;
  final bool? clip;
  final bool? randomizeIds;

  const DiceBearCoreOptions({
    this.seed,
    this.flip,
    this.rotate,
    this.scale,
    this.radius,
    this.size,
    this.backgroundColor,
    this.backgroundType,
    this.backgroundRotation,
    this.translateX,
    this.translateY,
    this.clip,
    this.randomizeIds,
  });

  DiceBearCoreOptions validated() {
    _checkRange(name: 'rotate', value: rotate, min: 0, max: 360);
    _checkRange(name: 'scale', value: scale, min: 0, max: 200);
    _checkRange(name: 'radius', value: radius, min: 0, max: 50);
    _checkRange(name: 'size', value: size, min: 1);
    _checkRange(name: 'translateX', value: translateX, min: -100, max: 100);
    _checkRange(name: 'translateY', value: translateY, min: -100, max: 100);

    if (backgroundRotation != null) {
      if (backgroundRotation!.length != 2) {
        throw ArgumentError.value(
          backgroundRotation,
          'backgroundRotation',
          'must contain exactly 2 values [min, max]',
        );
      }

      for (final value in backgroundRotation!) {
        _checkRange(
            name: 'backgroundRotation', value: value, min: -360, max: 360);
      }
    }

    if (backgroundColor != null) {
      for (final value in backgroundColor!) {
        if (value != 'transparent' && !_hexColorWithoutHash.hasMatch(value)) {
          throw ArgumentError.value(
            value,
            'backgroundColor',
            'must be "transparent" or a 6-digit hex color without #',
          );
        }
      }
    }

    return this;
  }

  Map<String, String> toQueryParameters() {
    validated();

    return _serializeMap({
      'seed': seed,
      'flip': flip,
      'rotate': rotate,
      'scale': scale,
      'radius': radius,
      'size': size,
      'backgroundColor': backgroundColor,
      'backgroundType':
          backgroundType?.map((e) => e.value).toList(growable: false),
      'backgroundRotation': backgroundRotation,
      'translateX': translateX,
      'translateY': translateY,
      'clip': clip,
      'randomizeIds': randomizeIds,
    });
  }

  /// Convenience converter for a single Flutter [Color].
  static List<String> fromColor(Color color) => [color.toDiceBearHex()];
}

/// Request model for generating URL and data from DiceBear HTTP API v9.
class DiceBearRequest<T extends DiceBearStyleOptions> {
  final DiceBearStyle style;
  final DiceBearFormat format;
  final DiceBearCoreOptions coreOptions;
  final T? styleOptions;

  DiceBearRequest({
    required this.style,
    this.format = DiceBearFormat.svg,
    this.coreOptions = const DiceBearCoreOptions(),
    this.styleOptions,
  });

  /// Final query parameters after merging core and style options.
  Map<String, String> get queryParameters {
    final query = SplayTreeMap<String, String>()
      ..addAll(coreOptions.toQueryParameters())
      ..addAll(styleOptions?.toQueryParameters() ?? const <String, String>{});
    return Map<String, String>.unmodifiable(query);
  }

  /// Fully generated URI for the request.
  Uri get uri {
    final resolvedStyle =
        style.isRandom ? DiceBearStyleRandom.randomStyle() : style;
    final query = queryParameters;

    return Uri.https(
      _diceBearHost,
      '/$_diceBearApiVersion/${resolvedStyle.value}/${format.value}',
      query.isEmpty ? null : query,
    );
  }

  /// Fetches bytes for image formats. For [DiceBearFormat.json], use [fetchJson].
  Future<Uint8List> fetchBytes({http.Client? client}) async {
    if (format == DiceBearFormat.json) {
      throw StateError(
          'Cannot fetch image bytes for json format. Use fetchJson().');
    }

    final localClient = client ?? http.Client();
    final shouldClose = client == null;

    try {
      final response = await localClient.get(uri);
      if (response.statusCode != 200) {
        throw Exception(
            'DiceBear request failed: ${response.statusCode} ${response.body}');
      }
      return response.bodyBytes;
    } finally {
      if (shouldClose) {
        localClient.close();
      }
    }
  }

  /// Fetches and parses JSON metadata for [DiceBearFormat.json].
  Future<Map<String, dynamic>> fetchJson({http.Client? client}) async {
    if (format != DiceBearFormat.json) {
      throw StateError('fetchJson() requires format=json.');
    }

    final localClient = client ?? http.Client();
    final shouldClose = client == null;

    try {
      final response = await localClient.get(uri);
      if (response.statusCode != 200) {
        throw Exception(
            'DiceBear request failed: ${response.statusCode} ${response.body}');
      }

      final decoded = jsonDecode(response.body);
      if (decoded is! Map<String, dynamic>) {
        throw FormatException(
            'Expected JSON object response, got ${decoded.runtimeType}.');
      }
      return decoded;
    } finally {
      if (shouldClose) {
        localClient.close();
      }
    }
  }

  /// Renders network image widgets for SVG and raster formats.
  Widget toImage({
    Key? key,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    WidgetBuilder? placeholderBuilder,
    bool matchTextDirection = false,
    bool allowDrawingOutsideViewBox = false,
    SvgTheme? theme,
  }) {
    if (format == DiceBearFormat.json) {
      throw StateError('JSON format is not renderable as an image widget.');
    }

    if (format.isSvg) {
      return SvgPicture.network(
        uri.toString(),
        key: key,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        semanticsLabel: semanticsLabel,
        excludeFromSemantics: excludeFromSemantics,
        clipBehavior: clipBehavior,
        placeholderBuilder: placeholderBuilder,
        matchTextDirection: matchTextDirection,
        allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
        theme: theme,
      );
    }

    return Image.network(
      uri.toString(),
      key: key,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      semanticLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
    );
  }
}

class DiceBearBuilder {
  final DiceBearStyle sprite;
  final String seed;
  /// Background colors
  final Color? backgroundColor;
  final int radius;
  final int? size;
  final int scale;
  final bool flip;
  final int rotate;
  final int translateX;
  final int translateY;

  DiceBearBuilder({
    this.sprite = DiceBearStyle.random,
    this.seed = '',
    this.backgroundColor,
    this.radius = 0,
    this.size,
    this.scale = 100,
    this.flip = false,
    this.rotate = 0,
    this.translateX = 0,
    this.translateY = 0,
  });

  DiceBearBuilder.withRandomSeed({
    this.sprite = DiceBearStyle.random,
    this.backgroundColor,
    this.radius = 0,
    this.size,
    this.scale = 100,
    this.flip = false,
    this.rotate = 0,
    this.translateX = 0,
    this.translateY = 0,
  }) : seed = _randomString();

  Avatar build() {
    final request = DiceBearRequest<DiceBearRawStyleOptions>(
      style: sprite,
      format: DiceBearFormat.svg,
      coreOptions: DiceBearCoreOptions(
        seed: seed,
        backgroundColor: backgroundColor == null
            ? null
            : DiceBearCoreOptions.fromColor(backgroundColor!),
        radius: radius,
        size: size,
        scale: scale,
        flip: flip,
        rotate: rotate,
        translateX: translateX,
        translateY: translateY,
      ),
    );

    return Avatar._(request.uri);
  }
}

/// Temporary compatibility wrapper over [DiceBearRequest].
@Deprecated('Use DiceBearRequest instead.')
class Avatar {
  final Uri svgUri;

  Avatar._(this.svgUri);

  Future<Uint8List?> asRawSvgBytes() async {
    try {
      final response = await http.get(svgUri);
      if (response.statusCode == 200) {
        return response.bodyBytes;
      }

      throw Exception(
          'response code is ${response.statusCode} with message ${response.body}');
    } catch (e, stackTrace) {
      debugPrintStack(
          stackTrace: stackTrace, label: 'Error occurred in rawSvg()');
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
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
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
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      theme: theme,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is Avatar && svgUri.toString() == other.svgUri.toString();

  @override
  int get hashCode => svgUri.toString().hashCode;
}

extension DiceBearStyleRandom on DiceBearStyle {
  static final Random _random = Random();

  static DiceBearStyle randomStyle() {
    final options = DiceBearStyle.values
        .where((style) => style != DiceBearStyle.random)
        .toList(growable: false);
    return options[_random.nextInt(options.length)];
  }
}

Map<String, String> _serializeMap(Map<String, dynamic> values) {
  final result = <String, String>{};

  values.forEach((key, value) {
    if (value == null) {
      return;
    }

    if (value is List) {
      if (value.isEmpty) {
        return;
      }

      if (value.every((item) => item is String)) {
        final strings = value.cast<String>();
        _validateStringArray(name: key, values: strings);

        if (key.toLowerCase().contains('color')) {
          _validateHexArray(
            name: key,
            values: strings,
            allowTransparent: true,
          );
        }
      }

      result[key] = value
          .map(
            (item) => _serializeQueryScalar(key: key, value: item),
          )
          .join(',');
      return;
    }

    result[key] = _serializeQueryScalar(key: key, value: value);
  });

  return result;
}

String _serializeQueryScalar({
  required String key,
  required dynamic value,
}) {
  if (value is String) {
    return value;
  }

  if (value is bool) {
    return value ? 'true' : 'false';
  }

  if (value is num) {
    return value.toString();
  }

  throw ArgumentError.value(
    value,
    key,
    'Unsupported query value type: ${value.runtimeType}',
  );
}

void _checkRange({
  required String name,
  required int? value,
  required int min,
  int? max,
}) {
  if (value == null) {
    return;
  }

  if (max == null) {
    if (value < min) {
      throw ArgumentError.value(value, name, 'must be >= $min');
    }
    return;
  }

  if (value < min || value > max) {
    throw ArgumentError.value(value, name, 'must be between $min and $max');
  }
}

void _checkProbability({
  required String name,
  required int? value,
}) {
  _checkRange(name: name, value: value, min: 0, max: 100);
}

void _validateHexArray({
  required String name,
  required List<String>? values,
  required bool allowTransparent,
}) {
  if (values == null) {
    return;
  }

  for (final value in values) {
    if (allowTransparent && value == 'transparent') {
      continue;
    }

    if (!_hexColorWithoutHash.hasMatch(value)) {
      throw ArgumentError.value(
        value,
        name,
        allowTransparent
            ? 'must contain only "transparent" or 6-digit hex colors without #'
            : 'must contain only 6-digit hex colors without #',
      );
    }
  }
}

void _validateStringArray({
  required String name,
  required List<String>? values,
}) {
  if (values == null) {
    return;
  }

  for (final value in values) {
    if (value.trim().isEmpty) {
      throw ArgumentError.value(value, name, 'must not contain empty values');
    }

    if (value.contains(',')) {
      throw ArgumentError.value(
        value,
        name,
        'must not contain commas; pass separate items via list values',
      );
    }
  }
}

void _validateAllowedValues({
  required String name,
  required List<String>? values,
  required Set<String> allowed,
}) {
  if (values == null) {
    return;
  }

  for (final value in values) {
    if (!allowed.contains(value)) {
      throw ArgumentError.value(
        value,
        name,
        'is not a supported value. Allowed values: ${allowed.join(', ')}',
      );
    }
  }
}

void _validatePatternArray({
  required String name,
  required List<String>? values,
  required RegExp pattern,
  required String description,
}) {
  if (values == null) {
    return;
  }
  for (final value in values) {
    if (!pattern.hasMatch(value)) {
      throw ArgumentError.value(value, name, description);
    }
  }
}

void _validateRangeArray({
  required String name,
  required List<int>? values,
}) {
  if (values == null) {
    return;
  }

  if (values.length != 2) {
    throw ArgumentError.value(
      values,
      name,
      'must contain exactly 2 numeric values [min, max]',
    );
  }
}

String _randomString({int length = 16}) {
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final random = Random();
  return String.fromCharCodes(
    Iterable.generate(
        length, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
  );
}
