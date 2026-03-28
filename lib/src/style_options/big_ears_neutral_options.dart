part of '../../dice_bear.dart';

class DiceBearBigEarsNeutralOptions extends DiceBearCharacterStyleOptions {
  final List<String>? cheek;
  final int? cheekProbability;
  final List<String>? nose;

  const DiceBearBigEarsNeutralOptions({
    this.cheek,
    this.cheekProbability,
    super.eyes,
    super.mouth,
    this.nose,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'cheek', values: cheek);
    _validatePatternArray(
      name: 'cheek',
      values: cheek,
      pattern: RegExp(r'^variant0[1-6]$'),
      description: 'must match variant01..variant06',
    );
    _checkProbability(name: 'cheekProbability', value: cheekProbability);
    _validateStringArray(name: 'eyes', values: eyes);
    _validatePatternArray(
      name: 'eyes',
      values: eyes,
      pattern: RegExp(r'^variant(0[1-9]|[12][0-9]|3[0-2])$'),
      description: 'must match variant01..variant32',
    );
    _validateStringArray(name: 'mouth', values: mouth);
    _validatePatternArray(
      name: 'mouth',
      values: mouth,
      pattern: RegExp(r'^variant(0[1-6]0[1-5]|070[1-8])$'),
      description: 'must match variant0101..variant0605 or variant0701..variant0708',
    );
    _validateStringArray(name: 'nose', values: nose);
    _validatePatternArray(
      name: 'nose',
      values: nose,
      pattern: RegExp(r'^variant(0[1-9]|1[0-2])$'),
      description: 'must match variant01..variant12',
    );
    return _serializeMap({
      'cheek': cheek,
      'cheekProbability': cheekProbability,
      'eyes': eyes,
      'mouth': mouth,
      'nose': nose,
    });
  }
}
