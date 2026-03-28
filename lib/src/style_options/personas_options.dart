part of '../../dice_bear.dart';

class DiceBearPersonasOptions extends DiceBearCharacterStyleOptions {
  final List<String>? body;
  final List<String>? clothingColor;
  final List<String>? facialHair;
  final int? facialHairProbability;
  final List<String>? hair;
  final List<String>? hairColor;
  final List<String>? nose;
  final List<String>? skinColor;

  const DiceBearPersonasOptions({
    this.body,
    this.clothingColor,
    super.eyes,
    this.facialHair,
    this.facialHairProbability,
    this.hair,
    this.hairColor,
    super.mouth,
    this.nose,
    this.skinColor,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'body', values: body);
    _validateAllowedValues(name: 'body', values: body, allowed: const {'checkered', 'rounded', 'small', 'squared'});
    _validateAllowedValues(
      name: 'clothingColor',
      values: clothingColor,
      allowed: const {'456dff', '54d7c7', '6dbb58', '7555ca', 'e24553', 'f3b63a', 'f55d81'},
    );
    _validateStringArray(name: 'eyes', values: eyes);
    _validateAllowedValues(
      name: 'eyes',
      values: eyes,
      allowed: const {'glasses', 'happy', 'open', 'sleep', 'sunglasses', 'wink'},
    );
    _validateStringArray(name: 'facialHair', values: facialHair);
    _validateAllowedValues(
      name: 'facialHair',
      values: facialHair,
      allowed: const {'beardMustache', 'goatee', 'pyramid', 'shadow', 'soulPatch', 'walrus'},
    );
    _checkProbability(name: 'facialHairProbability', value: facialHairProbability);
    _validateStringArray(name: 'hair', values: hair);
    _validateAllowedValues(
      name: 'hair',
      values: hair,
      allowed: const {
        'bald',
        'balding',
        'beanie',
        'bobBangs',
        'bobCut',
        'bunUndercut',
        'buzzcut',
        'cap',
        'curly',
        'curlyBun',
        'curlyHighTop',
        'extraLong',
        'fade',
        'long',
        'mohawk',
        'pigtails',
        'shortCombover',
        'shortComboverChops',
        'sideShave',
        'straightBun',
      },
    );
    _validateAllowedValues(
      name: 'hairColor',
      values: hairColor,
      allowed: const {'362c47', '6c4545', 'dee1f5', 'e15c66', 'e16381', 'f27d65', 'f29c65'},
    );
    _validateStringArray(name: 'mouth', values: mouth);
    _validateAllowedValues(
      name: 'mouth',
      values: mouth,
      allowed: const {'bigSmile', 'frown', 'lips', 'pacifier', 'smile', 'smirk', 'surprise'},
    );
    _validateStringArray(name: 'nose', values: nose);
    _validateAllowedValues(name: 'nose', values: nose, allowed: const {'mediumRound', 'smallRound', 'wrinkles'});
    _validateAllowedValues(
      name: 'skinColor',
      values: skinColor,
      allowed: const {'623d36', '92594b', 'b16a5b', 'd78774', 'e5a07e', 'e7a391', 'eeb4a4'},
    );
    return _serializeMap({
      'body': body,
      'clothingColor': clothingColor,
      'eyes': eyes,
      'facialHair': facialHair,
      'facialHairProbability': facialHairProbability,
      'hair': hair,
      'hairColor': hairColor,
      'mouth': mouth,
      'nose': nose,
      'skinColor': skinColor,
    });
  }
}
