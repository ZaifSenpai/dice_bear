part of '../../dice_bear.dart';

class DiceBearGlassOptions implements DiceBearStyleOptions {
  final List<String>? shape1;
  final List<int>? shape1OffsetX;
  final List<int>? shape1OffsetY;
  final List<int>? shape1Rotation;
  final List<String>? shape2;
  final List<int>? shape2OffsetX;
  final List<int>? shape2OffsetY;
  final List<int>? shape2Rotation;

  const DiceBearGlassOptions({
    this.shape1,
    this.shape1OffsetX,
    this.shape1OffsetY,
    this.shape1Rotation,
    this.shape2,
    this.shape2OffsetX,
    this.shape2OffsetY,
    this.shape2Rotation,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'shape1', values: shape1);
    _validateRangeArray(name: 'shape1OffsetX', values: shape1OffsetX);
    _validateRangeArray(name: 'shape1OffsetY', values: shape1OffsetY);
    _validateRangeArray(name: 'shape1Rotation', values: shape1Rotation);
    _validateStringArray(name: 'shape2', values: shape2);
    _validateRangeArray(name: 'shape2OffsetX', values: shape2OffsetX);
    _validateRangeArray(name: 'shape2OffsetY', values: shape2OffsetY);
    _validateRangeArray(name: 'shape2Rotation', values: shape2Rotation);
    return _serializeMap({
      'shape1': shape1,
      'shape1OffsetX': shape1OffsetX,
      'shape1OffsetY': shape1OffsetY,
      'shape1Rotation': shape1Rotation,
      'shape2': shape2,
      'shape2OffsetX': shape2OffsetX,
      'shape2OffsetY': shape2OffsetY,
      'shape2Rotation': shape2Rotation,
    });
  }
}
