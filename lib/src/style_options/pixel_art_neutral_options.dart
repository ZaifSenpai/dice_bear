part of '../../dice_bear.dart';

class DiceBearPixelArtNeutralOptions extends DiceBearCharacterStyleOptions {
  final List<String>? eyesColor;
  final List<String>? glasses;
  final List<String>? glassesColor;
  final int? glassesProbability;
  final List<String>? mouthColor;

  const DiceBearPixelArtNeutralOptions({
    super.eyes,
    this.eyesColor,
    this.glasses,
    this.glassesColor,
    this.glassesProbability,
    super.mouth,
    this.mouthColor,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'eyes', values: eyes);
    _validatePatternArray(
      name: 'eyes',
      values: eyes,
      pattern: RegExp(r'^variant(0[1-9]|1[0-2])$'),
      description: 'must match variant01..variant12',
    );
    _validateAllowedValues(
      name: 'eyesColor',
      values: eyesColor,
      allowed: const {'588387', '5b7c8b', '647b90', '697b94', '76778b', '876658'},
    );
    _validateStringArray(name: 'glasses', values: glasses);
    _validatePatternArray(
      name: 'glasses',
      values: glasses,
      pattern: RegExp(r'^(dark0[1-7]|light0[1-7])$'),
      description: 'must match dark01..dark07 or light01..light07',
    );
    _validateAllowedValues(
      name: 'glassesColor',
      values: glassesColor,
      allowed: const {'191919', '323232', '43677d', '4b4b4b', '5f705c', 'a04b5d'},
    );
    _checkProbability(name: 'glassesProbability', value: glassesProbability);
    _validateStringArray(name: 'mouth', values: mouth);
    _validatePatternArray(
      name: 'mouth',
      values: mouth,
      pattern: RegExp(r'^(happy(0[1-9]|1[0-3])|sad(0[1-9]|10))$'),
      description: 'must match happy01..happy13 or sad01..sad10',
    );
    _validateAllowedValues(
      name: 'mouthColor',
      values: mouthColor,
      allowed: const {'c98276', 'd29985', 'de0f0d', 'e35d6a'},
    );
    return _serializeMap({
      'eyes': eyes,
      'eyesColor': eyesColor,
      'glasses': glasses,
      'glassesColor': glassesColor,
      'glassesProbability': glassesProbability,
      'mouth': mouth,
      'mouthColor': mouthColor,
    });
  }
}
