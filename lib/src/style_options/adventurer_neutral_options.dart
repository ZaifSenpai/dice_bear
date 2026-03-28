part of '../../dice_bear.dart';

class DiceBearAdventurerNeutralOptions extends DiceBearCharacterStyleOptions {
  final List<String>? eyebrows;
  final List<String>? glasses;
  final int? glassesProbability;

  const DiceBearAdventurerNeutralOptions({
    this.eyebrows,
    super.eyes,
    this.glasses,
    this.glassesProbability,
    super.mouth,
  });

  @override
  Map<String, String> toQueryParameters() {
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
    _validateStringArray(name: 'glasses', values: glasses);
    _validatePatternArray(
      name: 'glasses',
      values: glasses,
      pattern: RegExp(r'^variant0[1-5]$'),
      description: 'must match variant01..variant05',
    );
    _checkProbability(name: 'glassesProbability', value: glassesProbability);
    _validateStringArray(name: 'mouth', values: mouth);
    _validatePatternArray(
      name: 'mouth',
      values: mouth,
      pattern: RegExp(r'^variant(0[1-9]|1[0-9]|2[0-9]|30)$'),
      description: 'must match variant01..variant30',
    );
    return _serializeMap({
      'eyebrows': eyebrows,
      'eyes': eyes,
      'glasses': glasses,
      'glassesProbability': glassesProbability,
      'mouth': mouth,
    });
  }
}
