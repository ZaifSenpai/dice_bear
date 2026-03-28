part of '../../dice_bear.dart';

class DiceBearAvataaarsOptions extends DiceBearCharacterStyleOptions {
  final List<String>? accessories;
  final List<String>? accessoriesColor;
  final int? accessoriesProbability;
  final List<String>? base;
  final List<String>? clothesColor;
  final List<String>? clothing;
  final List<String>? clothingGraphic;
  final List<String>? eyebrows;
  final List<String>? facialHair;
  final List<String>? facialHairColor;
  final int? facialHairProbability;
  final List<String>? hairColor;
  final List<String>? hatColor;
  final List<String>? nose;
  final List<String>? skinColor;
  final List<String>? style;
  final List<String>? top;
  final int? topProbability;

  const DiceBearAvataaarsOptions({
    this.accessories,
    this.accessoriesColor,
    this.accessoriesProbability,
    this.base,
    this.clothesColor,
    this.clothing,
    this.clothingGraphic,
    this.eyebrows,
    super.eyes,
    this.facialHair,
    this.facialHairColor,
    this.facialHairProbability,
    this.hairColor,
    this.hatColor,
    super.mouth,
    this.nose,
    this.skinColor,
    this.style,
    this.top,
    this.topProbability,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'accessories', values: accessories);
    _validateAllowedValues(
      name: 'accessories',
      values: accessories,
      allowed: const {
        'eyepatch',
        'kurt',
        'prescription01',
        'prescription02',
        'round',
        'sunglasses',
        'wayfarers',
      },
    );
    _validateHexArray(name: 'accessoriesColor', values: accessoriesColor, allowTransparent: true);
    _checkProbability(name: 'accessoriesProbability', value: accessoriesProbability);
    _validateStringArray(name: 'base', values: base);
    _validateAllowedValues(name: 'base', values: base, allowed: const {'default'});
    _validateHexArray(name: 'clothesColor', values: clothesColor, allowTransparent: true);
    _validateStringArray(name: 'clothing', values: clothing);
    _validateAllowedValues(
      name: 'clothing',
      values: clothing,
      allowed: const {
        'blazerAndShirt',
        'blazerAndSweater',
        'collarAndSweater',
        'graphicShirt',
        'hoodie',
        'overall',
        'shirtCrewNeck',
        'shirtScoopNeck',
        'shirtVNeck',
      },
    );
    _validateStringArray(name: 'clothingGraphic', values: clothingGraphic);
    _validateAllowedValues(
      name: 'clothingGraphic',
      values: clothingGraphic,
      allowed: const {
        'bat',
        'bear',
        'cumbia',
        'deer',
        'diamond',
        'hola',
        'pizza',
        'resist',
        'skull',
        'skullOutline',
      },
    );
    _validateStringArray(name: 'eyebrows', values: eyebrows);
    _validateAllowedValues(
      name: 'eyebrows',
      values: eyebrows,
      allowed: const {
        'angry',
        'angryNatural',
        'default',
        'defaultNatural',
        'flatNatural',
        'frownNatural',
        'raisedExcited',
        'raisedExcitedNatural',
        'sadConcerned',
        'sadConcernedNatural',
        'unibrowNatural',
        'upDown',
        'upDownNatural',
      },
    );
    _validateStringArray(name: 'eyes', values: eyes);
    _validateAllowedValues(
      name: 'eyes',
      values: eyes,
      allowed: const {
        'closed',
        'cry',
        'default',
        'eyeRoll',
        'happy',
        'hearts',
        'side',
        'squint',
        'surprised',
        'wink',
        'winkWacky',
        'xDizzy',
      },
    );
    _validateStringArray(name: 'facialHair', values: facialHair);
    _validateAllowedValues(
      name: 'facialHair',
      values: facialHair,
      allowed: const {
        'beardLight',
        'beardMajestic',
        'beardMedium',
        'moustacheFancy',
        'moustacheMagnum',
      },
    );
    _validateHexArray(name: 'facialHairColor', values: facialHairColor, allowTransparent: true);
    _checkProbability(name: 'facialHairProbability', value: facialHairProbability);
    _validateHexArray(name: 'hairColor', values: hairColor, allowTransparent: true);
    _validateHexArray(name: 'hatColor', values: hatColor, allowTransparent: true);
    _validateStringArray(name: 'mouth', values: mouth);
    _validateAllowedValues(
      name: 'mouth',
      values: mouth,
      allowed: const {
        'concerned',
        'default',
        'disbelief',
        'eating',
        'grimace',
        'sad',
        'screamOpen',
        'serious',
        'smile',
        'tongue',
        'twinkle',
        'vomit',
      },
    );
    _validateStringArray(name: 'nose', values: nose);
    _validateAllowedValues(name: 'nose', values: nose, allowed: const {'default'});
    _validateHexArray(name: 'skinColor', values: skinColor, allowTransparent: true);
    _validateStringArray(name: 'style', values: style);
    _validateAllowedValues(name: 'style', values: style, allowed: const {'circle', 'default'});
    _validateStringArray(name: 'top', values: top);
    _validateAllowedValues(
      name: 'top',
      values: top,
      allowed: const {
        'bigHair',
        'bob',
        'bun',
        'curly',
        'curvy',
        'dreads',
        'dreads01',
        'dreads02',
        'frida',
        'frizzle',
        'fro',
        'froBand',
        'hat',
        'hijab',
        'longButNotTooLong',
        'miaWallace',
        'shaggy',
        'shaggyMullet',
        'shavedSides',
        'shortCurly',
        'shortFlat',
        'shortRound',
        'shortWaved',
        'sides',
        'straight01',
        'straight02',
        'straightAndStrand',
        'theCaesar',
        'theCaesarAndSidePart',
        'turban',
        'winterHat1',
        'winterHat02',
        'winterHat03',
        'winterHat04',
      },
    );
    _checkProbability(name: 'topProbability', value: topProbability);
    return _serializeMap({
      'accessories': accessories,
      'accessoriesColor': accessoriesColor,
      'accessoriesProbability': accessoriesProbability,
      'base': base,
      'clothesColor': clothesColor,
      'clothing': clothing,
      'clothingGraphic': clothingGraphic,
      'eyebrows': eyebrows,
      'eyes': eyes,
      'facialHair': facialHair,
      'facialHairColor': facialHairColor,
      'facialHairProbability': facialHairProbability,
      'hairColor': hairColor,
      'hatColor': hatColor,
      'mouth': mouth,
      'nose': nose,
      'skinColor': skinColor,
      'style': style,
      'top': top,
      'topProbability': topProbability,
    });
  }
}
