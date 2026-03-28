part of '../../dice_bear.dart';

class DiceBearThumbsOptions extends DiceBearCharacterStyleOptions {
  final List<String>? eyesColor;
  final List<String>? face;
  final List<int>? faceOffsetX;
  final List<int>? faceOffsetY;
  final List<int>? faceRotation;
  final List<String>? mouthColor;
  final List<String>? shape;
  final List<String>? shapeColor;
  final List<int>? shapeOffsetX;
  final List<int>? shapeOffsetY;
  final List<int>? shapeRotation;

  const DiceBearThumbsOptions({
    super.eyes,
    this.eyesColor,
    this.face,
    this.faceOffsetX,
    this.faceOffsetY,
    this.faceRotation,
    super.mouth,
    this.mouthColor,
    this.shape,
    this.shapeColor,
    this.shapeOffsetX,
    this.shapeOffsetY,
    this.shapeRotation,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'eyes', values: eyes);
    _validatePatternArray(
      name: 'eyes',
      values: eyes,
      pattern: RegExp(r'^variant[1-9]W(10|12|14|16)$'),
      description: 'must match variant{1..9}W{10|12|14|16}',
    );
    _validateHexArray(name: 'eyesColor', values: eyesColor, allowTransparent: true);
    _validateAllowedValues(
      name: 'eyesColor',
      values: eyesColor,
      allowed: const {'ffffff'},
    );
    _validateStringArray(name: 'face', values: face);
    _validateAllowedValues(
      name: 'face',
      values: face,
      allowed: const {'variant1', 'variant2', 'variant3', 'variant4', 'variant5'},
    );
    _validateRangeArray(name: 'faceOffsetX', values: faceOffsetX);
    _validateRangeArray(name: 'faceOffsetY', values: faceOffsetY);
    _validateRangeArray(name: 'faceRotation', values: faceRotation);
    _validateStringArray(name: 'mouth', values: mouth);
    _validateAllowedValues(
      name: 'mouth',
      values: mouth,
      allowed: const {'variant1', 'variant2', 'variant3', 'variant4', 'variant5'},
    );
    _validateHexArray(name: 'mouthColor', values: mouthColor, allowTransparent: true);
    _validateAllowedValues(
      name: 'mouthColor',
      values: mouthColor,
      allowed: const {'ffffff'},
    );
    _validateStringArray(name: 'shape', values: shape);
    _validateAllowedValues(
      name: 'shape',
      values: shape,
      allowed: const {'default'},
    );
    _validateHexArray(name: 'shapeColor', values: shapeColor, allowTransparent: true);
    _validateAllowedValues(
      name: 'shapeColor',
      values: shapeColor,
      allowed: const {'0a5b83', '1c799f', '69d2e7', 'f1f4dc', 'f88c49'},
    );
    _validateRangeArray(name: 'shapeOffsetX', values: shapeOffsetX);
    _validateRangeArray(name: 'shapeOffsetY', values: shapeOffsetY);
    _validateRangeArray(name: 'shapeRotation', values: shapeRotation);
    return _serializeMap({
      'eyes': eyes,
      'eyesColor': eyesColor,
      'face': face,
      'faceOffsetX': faceOffsetX,
      'faceOffsetY': faceOffsetY,
      'faceRotation': faceRotation,
      'mouth': mouth,
      'mouthColor': mouthColor,
      'shape': shape,
      'shapeColor': shapeColor,
      'shapeOffsetX': shapeOffsetX,
      'shapeOffsetY': shapeOffsetY,
      'shapeRotation': shapeRotation,
    });
  }
}
