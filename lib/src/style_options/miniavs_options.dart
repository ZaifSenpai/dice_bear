part of '../../dice_bear.dart';

class DiceBearMiniavsOptions extends DiceBearCharacterStyleOptions {
  final List<String>? blushes;
  final int? blushesProbability;
  final List<String>? body;
  final List<String>? bodyColor;
  final List<String>? glasses;
  final int? glassesProbability;
  final List<String>? hair;
  final List<String>? hairColor;
  final List<String>? head;
  final List<String>? mustache;
  final int? mustacheProbability;
  final List<String>? skinColor;

  const DiceBearMiniavsOptions({
    this.blushes,
    this.blushesProbability,
    this.body,
    this.bodyColor,
    super.eyes,
    this.glasses,
    this.glassesProbability,
    this.hair,
    this.hairColor,
    this.head,
    super.mouth,
    this.mustache,
    this.mustacheProbability,
    this.skinColor,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'blushes', values: blushes);
    _validateAllowedValues(name: 'blushes', values: blushes, allowed: const {'default'});
    _checkProbability(name: 'blushesProbability', value: blushesProbability);
    _validateStringArray(name: 'body', values: body);
    _validateAllowedValues(name: 'body', values: body, allowed: const {'golf', 'tShirt'});
    _validateAllowedValues(name: 'bodyColor', values: bodyColor, allowed: const {'3633e0', 'e05a33', 'ff4dd8'});
    _validateStringArray(name: 'eyes', values: eyes);
    _validateAllowedValues(name: 'eyes', values: eyes, allowed: const {'confident', 'happy', 'normal'});
    _validateStringArray(name: 'glasses', values: glasses);
    _validateAllowedValues(name: 'glasses', values: glasses, allowed: const {'normal'});
    _checkProbability(name: 'glassesProbability', value: glassesProbability);
    _validateStringArray(name: 'hair', values: hair);
    _validateAllowedValues(
      name: 'hair',
      values: hair,
      allowed: const {
        'balndess',
        'classic01',
        'classic02',
        'curly',
        'elvis',
        'long',
        'ponyTail',
        'slaughter',
        'stylish',
      },
    );
    _validateAllowedValues(name: 'hairColor', values: hairColor, allowed: const {'1b0b47', '47280b', 'ad3a20'});
    _validateStringArray(name: 'head', values: head);
    _validateAllowedValues(name: 'head', values: head, allowed: const {'normal', 'thin', 'wide'});
    _validateStringArray(name: 'mouth', values: mouth);
    _validateAllowedValues(name: 'mouth', values: mouth, allowed: const {'default', 'missingTooth'});
    _validateStringArray(name: 'mustache', values: mustache);
    _validateAllowedValues(
      name: 'mustache',
      values: mustache,
      allowed: const {'freddy', 'horshoe', 'pencilThin', 'pencilThinBeard'},
    );
    _checkProbability(name: 'mustacheProbability', value: mustacheProbability);
    _validateAllowedValues(name: 'skinColor', values: skinColor, allowed: const {'836055', 'f5d0c5', 'ffcb7e'});
    return _serializeMap({
      'blushes': blushes,
      'blushesProbability': blushesProbability,
      'body': body,
      'bodyColor': bodyColor,
      'eyes': eyes,
      'glasses': glasses,
      'glassesProbability': glassesProbability,
      'hair': hair,
      'hairColor': hairColor,
      'head': head,
      'mouth': mouth,
      'mustache': mustache,
      'mustacheProbability': mustacheProbability,
      'skinColor': skinColor,
    });
  }
}
