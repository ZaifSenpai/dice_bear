part of '../../dice_bear.dart';

class DiceBearNotionistsNeutralOptions implements DiceBearStyleOptions {
  final List<String>? brows;
  final List<String>? eyes;
  final List<String>? glasses;
  final int? glassesProbability;
  final List<String>? lips;
  final List<String>? nose;

  const DiceBearNotionistsNeutralOptions({
    this.brows,
    this.eyes,
    this.glasses,
    this.glassesProbability,
    this.lips,
    this.nose,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'brows', values: brows);
    _validatePatternArray(
      name: 'brows',
      values: brows,
      pattern: RegExp(r'^variant(0[1-9]|1[0-3])$'),
      description: 'must match variant01..variant13',
    );
    _validateStringArray(name: 'eyes', values: eyes);
    _validatePatternArray(
      name: 'eyes',
      values: eyes,
      pattern: RegExp(r'^variant0[1-5]$'),
      description: 'must match variant01..variant05',
    );
    _validateStringArray(name: 'glasses', values: glasses);
    _validatePatternArray(
      name: 'glasses',
      values: glasses,
      pattern: RegExp(r'^variant(0[1-9]|1[0-1])$'),
      description: 'must match variant01..variant11',
    );
    _checkProbability(name: 'glassesProbability', value: glassesProbability);
    _validateStringArray(name: 'lips', values: lips);
    _validatePatternArray(
      name: 'lips',
      values: lips,
      pattern: RegExp(r'^variant(0[1-9]|[12][0-9]|30)$'),
      description: 'must match variant01..variant30',
    );
    _validateStringArray(name: 'nose', values: nose);
    _validatePatternArray(
      name: 'nose',
      values: nose,
      pattern: RegExp(r'^variant(0[1-9]|1[0-9]|20)$'),
      description: 'must match variant01..variant20',
    );
    return _serializeMap({
      'brows': brows,
      'eyes': eyes,
      'glasses': glasses,
      'glassesProbability': glassesProbability,
      'lips': lips,
      'nose': nose,
    });
  }
}
