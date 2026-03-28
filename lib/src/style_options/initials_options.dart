part of '../../dice_bear.dart';

class DiceBearInitialsOptions implements DiceBearStyleOptions {
  final List<String>? textColor;

  /// Deprecated by DiceBear for HTTP API raster output, still supported in SVG.
  final List<String>? fontFamily;

  /// Deprecated by DiceBear for HTTP API raster output, still supported in SVG.
  final int? fontSize;

  /// Deprecated by DiceBear for HTTP API raster output, still supported in SVG.
  final int? chars;

  /// Deprecated by DiceBear for HTTP API raster output, still supported in SVG.
  final int? fontWeight;

  const DiceBearInitialsOptions({
    this.textColor,
    this.fontFamily,
    this.fontSize,
    this.chars,
    this.fontWeight,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateHexArray(name: 'textColor', values: textColor, allowTransparent: false);
    _validateStringArray(name: 'fontFamily', values: fontFamily);
    _checkRange(name: 'fontSize', value: fontSize, min: 1);
    _checkRange(name: 'chars', value: chars, min: 1);
    _checkRange(name: 'fontWeight', value: fontWeight, min: 100, max: 900);

    return _serializeMap({
      'textColor': textColor,
      'fontFamily': fontFamily,
      'fontSize': fontSize,
      'chars': chars,
      'fontWeight': fontWeight,
    });
  }
}
