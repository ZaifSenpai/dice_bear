part of '../../dice_bear.dart';

class DiceBearCroodlesOptions extends DiceBearCharacterStyleOptions {
  final List<String>? baseColor;
  final List<String>? beard;
  final int? beardProbability;
  final List<String>? face;
  final List<String>? mustache;
  final int? mustacheProbability;
  final List<String>? nose;
  final List<String>? top;
  final List<String>? topColor;

  const DiceBearCroodlesOptions({
    this.baseColor,
    this.beard,
    this.beardProbability,
    super.eyes,
    this.face,
    super.mouth,
    this.mustache,
    this.mustacheProbability,
    this.nose,
    this.top,
    this.topColor,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'baseColor', values: baseColor);
    _validateAllowedValues(name: 'baseColor', values: baseColor, allowed: const {'ffffff'});
    _validateStringArray(name: 'beard', values: beard);
    _validatePatternArray(
      name: 'beard',
      values: beard,
      pattern: RegExp(r'^variant0[1-5]$'),
      description: 'must match variant01..variant05',
    );
    _checkProbability(name: 'beardProbability', value: beardProbability);
    _validateStringArray(name: 'eyes', values: eyes);
    _validatePatternArray(
      name: 'eyes',
      values: eyes,
      pattern: RegExp(r'^variant(0[1-9]|1[0-6])$'),
      description: 'must match variant01..variant16',
    );
    _validateStringArray(name: 'face', values: face);
    _validatePatternArray(
      name: 'face',
      values: face,
      pattern: RegExp(r'^variant0[1-8]$'),
      description: 'must match variant01..variant08',
    );
    _validateStringArray(name: 'mouth', values: mouth);
    _validatePatternArray(
      name: 'mouth',
      values: mouth,
      pattern: RegExp(r'^variant(0[1-9]|1[0-8])$'),
      description: 'must match variant01..variant18',
    );
    _validateStringArray(name: 'mustache', values: mustache);
    _validatePatternArray(
      name: 'mustache',
      values: mustache,
      pattern: RegExp(r'^variant0[1-4]$'),
      description: 'must match variant01..variant04',
    );
    _checkProbability(name: 'mustacheProbability', value: mustacheProbability);
    _validateStringArray(name: 'nose', values: nose);
    _validatePatternArray(
      name: 'nose',
      values: nose,
      pattern: RegExp(r'^variant0[1-9]$'),
      description: 'must match variant01..variant09',
    );
    _validateStringArray(name: 'top', values: top);
    _validatePatternArray(
      name: 'top',
      values: top,
      pattern: RegExp(r'^variant(0[1-9]|1[0-9]|2[0-9])$'),
      description: 'must match variant01..variant29',
    );
    return _serializeMap({
      'baseColor': baseColor,
      'beard': beard,
      'beardProbability': beardProbability,
      'eyes': eyes,
      'face': face,
      'mouth': mouth,
      'mustache': mustache,
      'mustacheProbability': mustacheProbability,
      'nose': nose,
      'top': top,
      'topColor': topColor,
    });
  }
}
