part of '../../dice_bear.dart';

class DiceBearBigSmileOptions extends DiceBearCharacterStyleOptions {
  final List<String>? accessories;
  final int? accessoriesProbability;
  final List<String>? face;
  final List<String>? hair;
  final List<String>? hairColor;
  final List<String>? skinColor;

  const DiceBearBigSmileOptions({
    this.accessories,
    this.accessoriesProbability,
    super.eyes,
    this.face,
    this.hair,
    this.hairColor,
    super.mouth,
    this.skinColor,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'accessories', values: accessories);
    _validateAllowedValues(
      name: 'accessories',
      values: accessories,
      allowed: const {
        'catEars',
        'clownNose',
        'faceMask',
        'glasses',
        'mustache',
        'sailormoonCrown',
        'sleepMask',
        'sunglasses',
      },
    );
    _checkProbability(name: 'accessoriesProbability', value: accessoriesProbability);
    _validateStringArray(name: 'eyes', values: eyes);
    _validateAllowedValues(
      name: 'eyes',
      values: eyes,
      allowed: const {
        'angry',
        'cheery',
        'confused',
        'normal',
        'sad',
        'sleepy',
        'starstruck',
        'winking',
      },
    );
    _validateStringArray(name: 'face', values: face);
    _validateAllowedValues(name: 'face', values: face, allowed: const {'base'});
    _validateStringArray(name: 'hair', values: hair);
    _validateAllowedValues(
      name: 'hair',
      values: hair,
      allowed: const {
        'bangs',
        'bowlCutHair',
        'braids',
        'bunHair',
        'curlyBob',
        'curlyShortHair',
        'froBun',
        'halfShavedHead',
        'mohawk',
        'shavedHead',
        'shortHair',
        'straightHair',
        'wavyBob',
      },
    );
    _validateStringArray(name: 'mouth', values: mouth);
    _validateAllowedValues(
      name: 'mouth',
      values: mouth,
      allowed: const {
        'awkwardSmile',
        'braces',
        'gapSmile',
        'kawaii',
        'openedSmile',
        'openSad',
        'teethSmile',
        'unimpressed',
      },
    );
    return _serializeMap({
      'accessories': accessories,
      'accessoriesProbability': accessoriesProbability,
      'eyes': eyes,
      'face': face,
      'hair': hair,
      'hairColor': hairColor,
      'mouth': mouth,
      'skinColor': skinColor,
    });
  }
}
