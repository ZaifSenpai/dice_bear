part of '../../dice_bear.dart';

class DiceBearAdventurerOptions extends DiceBearCharacterStyleOptions {
  final List<String>? base;
  final List<String>? earrings;
  final int? earringsProbability;
  final List<String>? eyebrows;
  final List<String>? features;
  final int? featuresProbability;
  final List<String>? glasses;
  final int? glassesProbability;
  final List<String>? hair;
  final List<String>? hairColor;
  final int? hairProbability;
  final List<String>? skinColor;

  const DiceBearAdventurerOptions({
    this.base,
    this.earrings,
    this.earringsProbability,
    this.eyebrows,
    super.eyes,
    this.features,
    this.featuresProbability,
    this.glasses,
    this.glassesProbability,
    this.hair,
    this.hairColor,
    this.hairProbability,
    super.mouth,
    this.skinColor,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'base', values: base);
    _validateAllowedValues(name: 'base', values: base, allowed: const {'default'});
    _validateStringArray(name: 'earrings', values: earrings);
    _validatePatternArray(
      name: 'earrings',
      values: earrings,
      pattern: RegExp(r'^variant0[1-6]$'),
      description: 'must match variant01..variant06',
    );
    _checkProbability(name: 'earringsProbability', value: earringsProbability);
    _validateStringArray(name: 'eyebrows', values: eyebrows);
    _validatePatternArray(
      name: 'eyebrows',
      values: eyebrows,
      pattern: RegExp(r'^variant(0[1-9]|1[0-5])$'),
      description: 'must match variant01..variant15',
    );
    _validateStringArray(name: 'eyes', values: eyes);
    _validatePatternArray(
      name: 'eyes',
      values: eyes,
      pattern: RegExp(r'^variant(0[1-9]|1[0-9]|2[0-6])$'),
      description: 'must match variant01..variant26',
    );
    _validateStringArray(name: 'features', values: features);
    _validateAllowedValues(
      name: 'features',
      values: features,
      allowed: const {'birthmark', 'blush', 'freckles', 'mustache'},
    );
    _checkProbability(name: 'featuresProbability', value: featuresProbability);
    _validateStringArray(name: 'glasses', values: glasses);
    _validatePatternArray(
      name: 'glasses',
      values: glasses,
      pattern: RegExp(r'^variant0[1-5]$'),
      description: 'must match variant01..variant05',
    );
    _checkProbability(name: 'glassesProbability', value: glassesProbability);
    _validateStringArray(name: 'hair', values: hair);
    _validatePatternArray(
      name: 'hair',
      values: hair,
      pattern: RegExp(r'^(long(0[1-9]|1[0-9]|2[0-6])|short(0[1-9]|1[0-9]))$'),
      description: 'must match long01..long26 or short01..short19',
    );
    _checkProbability(name: 'hairProbability', value: hairProbability);
    _validateStringArray(name: 'mouth', values: mouth);
    _validatePatternArray(
      name: 'mouth',
      values: mouth,
      pattern: RegExp(r'^variant(0[1-9]|1[0-9]|2[0-9]|30)$'),
      description: 'must match variant01..variant30',
    );
    return _serializeMap({
      'base': base,
      'earrings': earrings,
      'earringsProbability': earringsProbability,
      'eyebrows': eyebrows,
      'eyes': eyes,
      'features': features,
      'featuresProbability': featuresProbability,
      'glasses': glasses,
      'glassesProbability': glassesProbability,
      'hair': hair,
      'hairColor': hairColor,
      'hairProbability': hairProbability,
      'mouth': mouth,
      'skinColor': skinColor,
    });
  }
}
