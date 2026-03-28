part of '../../dice_bear.dart';

class DiceBearBigEarsOptions extends DiceBearCharacterStyleOptions {
  final List<String>? cheek;
  final int? cheekProbability;
  final List<String>? ear;
  final List<String>? face;
  final List<String>? frontHair;
  final List<String>? hair;
  final List<String>? hairColor;
  final List<String>? nose;
  final List<String>? sideburn;
  final List<String>? skinColor;

  const DiceBearBigEarsOptions({
    this.cheek,
    this.cheekProbability,
    this.ear,
    super.eyes,
    this.face,
    this.frontHair,
    this.hair,
    this.hairColor,
    super.mouth,
    this.nose,
    this.sideburn,
    this.skinColor,
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
    _validateStringArray(name: 'ear', values: ear);
    _validatePatternArray(
      name: 'ear',
      values: ear,
      pattern: RegExp(r'^variant0[1-8]$'),
      description: 'must match variant01..variant08',
    );
    _validateStringArray(name: 'eyes', values: eyes);
    _validatePatternArray(
      name: 'eyes',
      values: eyes,
      pattern: RegExp(r'^variant(0[1-9]|[12][0-9]|3[0-2])$'),
      description: 'must match variant01..variant32',
    );
    _validateStringArray(name: 'face', values: face);
    _validatePatternArray(
      name: 'face',
      values: face,
      pattern: RegExp(r'^variant(0[1-9]|10)$'),
      description: 'must match variant01..variant10',
    );
    _validateStringArray(name: 'frontHair', values: frontHair);
    _validatePatternArray(
      name: 'frontHair',
      values: frontHair,
      pattern: RegExp(r'^variant(0[1-9]|1[0-2])$'),
      description: 'must match variant01..variant12',
    );
    _validateStringArray(name: 'hair', values: hair);
    _validatePatternArray(
      name: 'hair',
      values: hair,
      pattern: RegExp(r'^(long(0[1-9]|1[0-9]|20)|short(0[1-9]|1[0-9]|20))$'),
      description: 'must match long01..long20 or short01..short20',
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
    _validateStringArray(name: 'sideburn', values: sideburn);
    _validatePatternArray(
      name: 'sideburn',
      values: sideburn,
      pattern: RegExp(r'^variant0[1-7]$'),
      description: 'must match variant01..variant07',
    );
    return _serializeMap({
      'cheek': cheek,
      'cheekProbability': cheekProbability,
      'ear': ear,
      'eyes': eyes,
      'face': face,
      'frontHair': frontHair,
      'hair': hair,
      'hairColor': hairColor,
      'mouth': mouth,
      'nose': nose,
      'sideburn': sideburn,
      'skinColor': skinColor,
    });
  }
}
