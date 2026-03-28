part of '../../dice_bear.dart';

class DiceBearDylanOptions implements DiceBearStyleOptions {
  final List<String>? facialHair;
  final int? facialHairProbability;
  final List<String>? hair;
  final List<String>? hairColor;
  final List<String>? mood;
  final List<String>? skinColor;

  const DiceBearDylanOptions({
    this.facialHair,
    this.facialHairProbability,
    this.hair,
    this.hairColor,
    this.mood,
    this.skinColor,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'facialHair', values: facialHair);
    _validateAllowedValues(name: 'facialHair', values: facialHair, allowed: const {'default'});
    _checkProbability(name: 'facialHairProbability', value: facialHairProbability);
    _validateStringArray(name: 'hair', values: hair);
    _validateAllowedValues(
      name: 'hair',
      values: hair,
      allowed: const {
        'bangs',
        'buns',
        'flatTop',
        'fluffy',
        'longCurls',
        'parting',
        'plain',
        'roundBob',
        'shaggy',
        'shortCurls',
        'spiky',
        'wavy',
      },
    );
    _validateStringArray(name: 'mood', values: mood);
    _validateAllowedValues(
      name: 'mood',
      values: mood,
      allowed: const {
        'angry',
        'confused',
        'happy',
        'hopeful',
        'neutral',
        'sad',
        'superHappy',
      },
    );
    return _serializeMap({
      'facialHair': facialHair,
      'facialHairProbability': facialHairProbability,
      'hair': hair,
      'hairColor': hairColor,
      'mood': mood,
      'skinColor': skinColor,
    });
  }
}
