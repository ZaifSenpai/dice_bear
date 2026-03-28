part of '../../dice_bear.dart';

class DiceBearMicahOptions extends DiceBearCharacterStyleOptions {
  final List<String>? base;
  final List<String>? baseColor;
  final List<String>? earringColor;
  final List<String>? earrings;
  final int? earringsProbability;
  final List<String>? ears;
  final List<String>? eyeShadowColor;
  final List<String>? eyebrows;
  final List<String>? eyebrowsColor;
  final List<String>? eyesColor;
  final List<String>? facialHair;
  final List<String>? facialHairColor;
  final int? facialHairProbability;
  final List<String>? glasses;
  final List<String>? glassesColor;
  final int? glassesProbability;
  final List<String>? hair;
  final List<String>? hairColor;
  final int? hairProbability;
  final List<String>? mouthColor;
  final List<String>? nose;
  final List<String>? shirt;
  final List<String>? shirtColor;

  const DiceBearMicahOptions({
    this.base,
    this.baseColor,
    this.earringColor,
    this.earrings,
    this.earringsProbability,
    this.ears,
    this.eyeShadowColor,
    this.eyebrows,
    this.eyebrowsColor,
    super.eyes,
    this.eyesColor,
    this.facialHair,
    this.facialHairColor,
    this.facialHairProbability,
    this.glasses,
    this.glassesColor,
    this.glassesProbability,
    this.hair,
    this.hairColor,
    this.hairProbability,
    super.mouth,
    this.mouthColor,
    this.nose,
    this.shirt,
    this.shirtColor,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'base', values: base);
    _validateAllowedValues(name: 'base', values: base, allowed: const {'standard'});
    _validateAllowedValues(name: 'baseColor', values: baseColor, allowed: const {'77311d', 'ac6651', 'f9c9b6'});
    _validateAllowedValues(
      name: 'earringColor',
      values: earringColor,
      allowed: const {
        '000000',
        '6bd9e9',
        '77311d',
        '9287ff',
        'ac6651',
        'd2eff3',
        'e0ddff',
        'f4d150',
        'f9c9b6',
        'fc909f',
        'ffeba4',
        'ffedef',
        'ffffff',
      },
    );
    _validateStringArray(name: 'earrings', values: earrings);
    _validateAllowedValues(name: 'earrings', values: earrings, allowed: const {'hoop', 'stud'});
    _checkProbability(name: 'earringsProbability', value: earringsProbability);
    _validateStringArray(name: 'ears', values: ears);
    _validateAllowedValues(name: 'ears', values: ears, allowed: const {'attached', 'detached'});
    _validateAllowedValues(
      name: 'eyeShadowColor',
      values: eyeShadowColor,
      allowed: const {'d2eff3', 'e0ddff', 'ffeba4', 'ffedef', 'ffffff'},
    );
    _validateStringArray(name: 'eyebrows', values: eyebrows);
    _validateAllowedValues(
      name: 'eyebrows',
      values: eyebrows,
      allowed: const {'down', 'eyelashesDown', 'eyelashesUp', 'up'},
    );
    _validateAllowedValues(name: 'eyebrowsColor', values: eyebrowsColor, allowed: const {'000000'});
    _validateStringArray(name: 'eyes', values: eyes);
    _validateAllowedValues(
      name: 'eyes',
      values: eyes,
      allowed: const {'eyes', 'eyesShadow', 'round', 'smiling', 'smilingShadow'},
    );
    _validateAllowedValues(name: 'eyesColor', values: eyesColor, allowed: const {'000000'});
    _validateStringArray(name: 'facialHair', values: facialHair);
    _validateAllowedValues(name: 'facialHair', values: facialHair, allowed: const {'beard', 'scruff'});
    _validateAllowedValues(name: 'facialHairColor', values: facialHairColor, allowed: const {'000000'});
    _checkProbability(name: 'facialHairProbability', value: facialHairProbability);
    _validateStringArray(name: 'glasses', values: glasses);
    _validateAllowedValues(name: 'glasses', values: glasses, allowed: const {'round', 'square'});
    _validateAllowedValues(
      name: 'glassesColor',
      values: glassesColor,
      allowed: const {
        '000000',
        '6bd9e9',
        '77311d',
        '9287ff',
        'ac6651',
        'd2eff3',
        'e0ddff',
        'f4d150',
        'f9c9b6',
        'fc909f',
        'ffeba4',
        'ffedef',
        'ffffff',
      },
    );
    _checkProbability(name: 'glassesProbability', value: glassesProbability);
    _validateStringArray(name: 'hair', values: hair);
    _validateAllowedValues(
      name: 'hair',
      values: hair,
      allowed: const {
        'dannyPhantom',
        'dougFunny',
        'fonze',
        'full',
        'mrClean',
        'mrT',
        'pixie',
        'turban',
      },
    );
    _validateAllowedValues(
      name: 'hairColor',
      values: hairColor,
      allowed: const {
        '000000',
        '6bd9e9',
        '77311d',
        '9287ff',
        'ac6651',
        'd2eff3',
        'e0ddff',
        'f4d150',
        'f9c9b6',
        'fc909f',
        'ffeba4',
        'ffedef',
        'ffffff',
      },
    );
    _checkProbability(name: 'hairProbability', value: hairProbability);
    _validateStringArray(name: 'mouth', values: mouth);
    _validateAllowedValues(
      name: 'mouth',
      values: mouth,
      allowed: const {'frown', 'laughing', 'nervous', 'pucker', 'sad', 'smile', 'smirk', 'surprised'},
    );
    _validateAllowedValues(name: 'mouthColor', values: mouthColor, allowed: const {'000000'});
    _validateStringArray(name: 'nose', values: nose);
    _validateAllowedValues(name: 'nose', values: nose, allowed: const {'curve', 'pointed', 'tound'});
    _validateStringArray(name: 'shirt', values: shirt);
    _validateAllowedValues(name: 'shirt', values: shirt, allowed: const {'collared', 'crew', 'open'});
    _validateAllowedValues(
      name: 'shirtColor',
      values: shirtColor,
      allowed: const {
        '000000',
        '6bd9e9',
        '77311d',
        '9287ff',
        'ac6651',
        'd2eff3',
        'e0ddff',
        'f4d150',
        'f9c9b6',
        'fc909f',
        'ffeba4',
        'ffedef',
        'ffffff',
      },
    );
    return _serializeMap({
      'base': base,
      'baseColor': baseColor,
      'earringColor': earringColor,
      'earrings': earrings,
      'earringsProbability': earringsProbability,
      'ears': ears,
      'eyeShadowColor': eyeShadowColor,
      'eyebrows': eyebrows,
      'eyebrowsColor': eyebrowsColor,
      'eyes': eyes,
      'eyesColor': eyesColor,
      'facialHair': facialHair,
      'facialHairColor': facialHairColor,
      'facialHairProbability': facialHairProbability,
      'glasses': glasses,
      'glassesColor': glassesColor,
      'glassesProbability': glassesProbability,
      'hair': hair,
      'hairColor': hairColor,
      'hairProbability': hairProbability,
      'mouth': mouth,
      'mouthColor': mouthColor,
      'nose': nose,
      'shirt': shirt,
      'shirtColor': shirtColor,
    });
  }
}
