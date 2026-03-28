part of '../../dice_bear.dart';

class DiceBearShapesOptions implements DiceBearStyleOptions {
  final List<String>? shape1;
  final List<String>? shape1Color;
  final List<int>? shape1OffsetX;
  final List<int>? shape1OffsetY;
  final List<int>? shape1Rotation;
  final List<String>? shape2;
  final List<String>? shape2Color;
  final List<int>? shape2OffsetX;
  final List<int>? shape2OffsetY;
  final List<int>? shape2Rotation;
  final List<String>? shape3;
  final List<String>? shape3Color;
  final List<int>? shape3OffsetX;
  final List<int>? shape3OffsetY;
  final List<int>? shape3Rotation;

  const DiceBearShapesOptions({
    this.shape1,
    this.shape1Color,
    this.shape1OffsetX,
    this.shape1OffsetY,
    this.shape1Rotation,
    this.shape2,
    this.shape2Color,
    this.shape2OffsetX,
    this.shape2OffsetY,
    this.shape2Rotation,
    this.shape3,
    this.shape3Color,
    this.shape3OffsetX,
    this.shape3OffsetY,
    this.shape3Rotation,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'shape1', values: shape1);
    _validateAllowedValues(
      name: 'shape1',
      values: shape1,
      allowed: const {
        'ellipse',
        'ellipseFilled',
        'line',
        'polygon',
        'polygonFilled',
        'rectangle',
        'rectangleFilled',
      },
    );
    _validateHexArray(name: 'shape1Color', values: shape1Color, allowTransparent: true);
    _validateAllowedValues(
      name: 'shape1Color',
      values: shape1Color,
      allowed: const {'0a5b83', '1c799f', '69d2e7', 'f1f4dc', 'f88c49'},
    );
    _validateRangeArray(name: 'shape1OffsetX', values: shape1OffsetX);
    _validateRangeArray(name: 'shape1OffsetY', values: shape1OffsetY);
    _validateRangeArray(name: 'shape1Rotation', values: shape1Rotation);
    _validateStringArray(name: 'shape2', values: shape2);
    _validateAllowedValues(
      name: 'shape2',
      values: shape2,
      allowed: const {
        'ellipse',
        'ellipseFilled',
        'line',
        'polygon',
        'polygonFilled',
        'rectangle',
        'rectangleFilled',
      },
    );
    _validateHexArray(name: 'shape2Color', values: shape2Color, allowTransparent: true);
    _validateAllowedValues(
      name: 'shape2Color',
      values: shape2Color,
      allowed: const {'0a5b83', '1c799f', '69d2e7', 'f1f4dc', 'f88c49'},
    );
    _validateRangeArray(name: 'shape2OffsetX', values: shape2OffsetX);
    _validateRangeArray(name: 'shape2OffsetY', values: shape2OffsetY);
    _validateRangeArray(name: 'shape2Rotation', values: shape2Rotation);
    _validateStringArray(name: 'shape3', values: shape3);
    _validateAllowedValues(
      name: 'shape3',
      values: shape3,
      allowed: const {
        'ellipse',
        'ellipseFilled',
        'line',
        'polygon',
        'polygonFilled',
        'rectangle',
        'rectangleFilled',
      },
    );
    _validateHexArray(name: 'shape3Color', values: shape3Color, allowTransparent: true);
    _validateAllowedValues(
      name: 'shape3Color',
      values: shape3Color,
      allowed: const {'0a5b83', '1c799f', '69d2e7', 'f1f4dc', 'f88c49'},
    );
    _validateRangeArray(name: 'shape3OffsetX', values: shape3OffsetX);
    _validateRangeArray(name: 'shape3OffsetY', values: shape3OffsetY);
    _validateRangeArray(name: 'shape3Rotation', values: shape3Rotation);
    return _serializeMap({
      'shape1': shape1,
      'shape1Color': shape1Color,
      'shape1OffsetX': shape1OffsetX,
      'shape1OffsetY': shape1OffsetY,
      'shape1Rotation': shape1Rotation,
      'shape2': shape2,
      'shape2Color': shape2Color,
      'shape2OffsetX': shape2OffsetX,
      'shape2OffsetY': shape2OffsetY,
      'shape2Rotation': shape2Rotation,
      'shape3': shape3,
      'shape3Color': shape3Color,
      'shape3OffsetX': shape3OffsetX,
      'shape3OffsetY': shape3OffsetY,
      'shape3Rotation': shape3Rotation,
    });
  }
}
