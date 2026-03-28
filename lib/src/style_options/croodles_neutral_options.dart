part of '../../dice_bear.dart';

class DiceBearCroodlesNeutralOptions extends DiceBearCharacterStyleOptions {
  final List<String>? nose;

  const DiceBearCroodlesNeutralOptions({
    super.eyes,
    super.mouth,
    this.nose,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'eyes', values: eyes);
    _validatePatternArray(
      name: 'eyes',
      values: eyes,
      pattern: RegExp(r'^variant(0[1-9]|1[0-6])$'),
      description: 'must match variant01..variant16',
    );
    _validateStringArray(name: 'mouth', values: mouth);
    _validatePatternArray(
      name: 'mouth',
      values: mouth,
      pattern: RegExp(r'^variant(0[1-9]|1[0-8])$'),
      description: 'must match variant01..variant18',
    );
    _validateStringArray(name: 'nose', values: nose);
    _validatePatternArray(
      name: 'nose',
      values: nose,
      pattern: RegExp(r'^variant0[1-9]$'),
      description: 'must match variant01..variant09',
    );
    return _serializeMap({
      'eyes': eyes,
      'mouth': mouth,
      'nose': nose,
    });
  }
}
