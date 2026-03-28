part of '../../dice_bear.dart';

class DiceBearNotionistsOptions implements DiceBearStyleOptions {
  final List<String>? base;
  final List<String>? beard;
  final int? beardProbability;
  final List<String>? body;
  final List<String>? bodyIcon;
  final int? bodyIconProbability;
  final List<String>? brows;
  final List<String>? eyes;
  final List<String>? gesture;
  final int? gestureProbability;
  final List<String>? glasses;
  final int? glassesProbability;
  final List<String>? hair;
  final List<String>? lips;
  final List<String>? nose;

  const DiceBearNotionistsOptions({
    this.base,
    this.beard,
    this.beardProbability,
    this.body,
    this.bodyIcon,
    this.bodyIconProbability,
    this.brows,
    this.eyes,
    this.gesture,
    this.gestureProbability,
    this.glasses,
    this.glassesProbability,
    this.hair,
    this.lips,
    this.nose,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'base', values: base);
    _validateAllowedValues(name: 'base', values: base, allowed: const {'variant01'});
    _validateStringArray(name: 'beard', values: beard);
    _validatePatternArray(
      name: 'beard',
      values: beard,
      pattern: RegExp(r'^variant(0[1-9]|1[0-2])$'),
      description: 'must match variant01..variant12',
    );
    _checkProbability(name: 'beardProbability', value: beardProbability);
    _validateStringArray(name: 'body', values: body);
    _validatePatternArray(
      name: 'body',
      values: body,
      pattern: RegExp(r'^variant(0[1-9]|1[0-9]|2[0-5])$'),
      description: 'must match variant01..variant25',
    );
    _validateStringArray(name: 'bodyIcon', values: bodyIcon);
    _validateAllowedValues(name: 'bodyIcon', values: bodyIcon, allowed: const {'electric', 'galaxy', 'saturn'});
    _checkProbability(name: 'bodyIconProbability', value: bodyIconProbability);
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
    _validateStringArray(name: 'gesture', values: gesture);
    _validateAllowedValues(
      name: 'gesture',
      values: gesture,
      allowed: const {'pointDown', 'pointLeft', 'pointRight', 'pointUp', 'wave'},
    );
    _checkProbability(name: 'gestureProbability', value: gestureProbability);
    _validateStringArray(name: 'glasses', values: glasses);
    _validatePatternArray(
      name: 'glasses',
      values: glasses,
      pattern: RegExp(r'^variant(0[1-9]|1[0-1])$'),
      description: 'must match variant01..variant11',
    );
    _checkProbability(name: 'glassesProbability', value: glassesProbability);
    _validateStringArray(name: 'hair', values: hair);
    _validatePatternArray(
      name: 'hair',
      values: hair,
      pattern: RegExp(r'^(hat|variant(0[1-9]|[1-5][0-9]|6[0-3]))$'),
      description: 'must be hat or variant01..variant63',
    );
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
      'base': base,
      'beard': beard,
      'beardProbability': beardProbability,
      'body': body,
      'bodyIcon': bodyIcon,
      'bodyIconProbability': bodyIconProbability,
      'brows': brows,
      'eyes': eyes,
      'gesture': gesture,
      'gestureProbability': gestureProbability,
      'glasses': glasses,
      'glassesProbability': glassesProbability,
      'hair': hair,
      'lips': lips,
      'nose': nose,
    });
  }
}
