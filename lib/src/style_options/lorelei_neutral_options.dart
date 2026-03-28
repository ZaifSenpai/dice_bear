part of '../../dice_bear.dart';

class DiceBearLoreleiNeutralOptions extends DiceBearCharacterStyleOptions {
  final List<String>? eyebrows;
  final List<String>? eyebrowsColor;
  final List<String>? eyesColor;
  final List<String>? freckles;
  final List<String>? frecklesColor;
  final int? frecklesProbability;
  final List<String>? glasses;
  final List<String>? glassesColor;
  final int? glassesProbability;
  final List<String>? mouthColor;
  final List<String>? nose;
  final List<String>? noseColor;

  const DiceBearLoreleiNeutralOptions({
    this.eyebrows,
    this.eyebrowsColor,
    super.eyes,
    this.eyesColor,
    this.freckles,
    this.frecklesColor,
    this.frecklesProbability,
    this.glasses,
    this.glassesColor,
    this.glassesProbability,
    super.mouth,
    this.mouthColor,
    this.nose,
    this.noseColor,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'eyebrows', values: eyebrows);
    _validatePatternArray(
      name: 'eyebrows',
      values: eyebrows,
      pattern: RegExp(r'^variant(0[1-9]|1[0-3])$'),
      description: 'must match variant01..variant13',
    );
    _validateAllowedValues(name: 'eyebrowsColor', values: eyebrowsColor, allowed: const {'000000'});
    _validateStringArray(name: 'eyes', values: eyes);
    _validatePatternArray(
      name: 'eyes',
      values: eyes,
      pattern: RegExp(r'^variant(0[1-9]|1[0-9]|2[0-4])$'),
      description: 'must match variant01..variant24',
    );
    _validateAllowedValues(name: 'eyesColor', values: eyesColor, allowed: const {'000000'});
    _validateStringArray(name: 'freckles', values: freckles);
    _validateAllowedValues(name: 'freckles', values: freckles, allowed: const {'variant01'});
    _validateAllowedValues(name: 'frecklesColor', values: frecklesColor, allowed: const {'000000'});
    _checkProbability(name: 'frecklesProbability', value: frecklesProbability);
    _validateStringArray(name: 'glasses', values: glasses);
    _validatePatternArray(
      name: 'glasses',
      values: glasses,
      pattern: RegExp(r'^variant0[1-5]$'),
      description: 'must match variant01..variant05',
    );
    _validateAllowedValues(name: 'glassesColor', values: glassesColor, allowed: const {'000000'});
    _checkProbability(name: 'glassesProbability', value: glassesProbability);
    _validateStringArray(name: 'mouth', values: mouth);
    _validatePatternArray(
      name: 'mouth',
      values: mouth,
      pattern: RegExp(r'^(happy(0[1-9]|1[0-8])|sad0[1-9])$'),
      description: 'must match happy01..happy18 or sad01..sad09',
    );
    _validateAllowedValues(name: 'mouthColor', values: mouthColor, allowed: const {'000000'});
    _validateStringArray(name: 'nose', values: nose);
    _validatePatternArray(
      name: 'nose',
      values: nose,
      pattern: RegExp(r'^variant0[1-6]$'),
      description: 'must match variant01..variant06',
    );
    _validateAllowedValues(name: 'noseColor', values: noseColor, allowed: const {'000000'});
    return _serializeMap({
      'eyebrows': eyebrows,
      'eyebrowsColor': eyebrowsColor,
      'eyes': eyes,
      'eyesColor': eyesColor,
      'freckles': freckles,
      'frecklesColor': frecklesColor,
      'frecklesProbability': frecklesProbability,
      'glasses': glasses,
      'glassesColor': glassesColor,
      'glassesProbability': glassesProbability,
      'mouth': mouth,
      'mouthColor': mouthColor,
      'nose': nose,
      'noseColor': noseColor,
    });
  }
}
