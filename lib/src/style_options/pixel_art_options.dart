part of '../../dice_bear.dart';

class DiceBearPixelArtOptions extends DiceBearCharacterStyleOptions {
  final List<String>? accessories;
  final List<String>? accessoriesColor;
  final int? accessoriesProbability;
  final List<String>? beard;
  final int? beardProbability;
  final List<String>? clothing;
  final List<String>? clothingColor;
  final List<String>? eyesColor;
  final List<String>? glasses;
  final List<String>? glassesColor;
  final int? glassesProbability;
  final List<String>? hair;
  final List<String>? hairColor;
  final List<String>? hat;
  final List<String>? hatColor;
  final int? hatProbability;
  final List<String>? mouthColor;
  final List<String>? skinColor;

  const DiceBearPixelArtOptions({
    this.accessories,
    this.accessoriesColor,
    this.accessoriesProbability,
    this.beard,
    this.beardProbability,
    this.clothing,
    this.clothingColor,
    super.eyes,
    this.eyesColor,
    this.glasses,
    this.glassesColor,
    this.glassesProbability,
    this.hair,
    this.hairColor,
    this.hat,
    this.hatColor,
    this.hatProbability,
    super.mouth,
    this.mouthColor,
    this.skinColor,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'accessories', values: accessories);
    _validateAllowedValues(
      name: 'accessories',
      values: accessories,
      allowed: const {'variant01', 'variant02', 'variant03', 'variant04'},
    );
    _validateHexArray(name: 'accessoriesColor', values: accessoriesColor, allowTransparent: true);
    _checkRange(name: 'accessoriesProbability', value: accessoriesProbability, min: 0, max: 100);

    _validateStringArray(name: 'beard', values: beard);
    _validateAllowedValues(
      name: 'beard',
      values: beard,
      allowed: const {
        'variant01',
        'variant02',
        'variant03',
        'variant04',
        'variant05',
        'variant06',
        'variant07',
        'variant08',
      },
    );
    _checkRange(name: 'beardProbability', value: beardProbability, min: 0, max: 100);

    _validateStringArray(name: 'clothing', values: clothing);
    _validateHexArray(name: 'clothingColor', values: clothingColor, allowTransparent: true);

    _validateStringArray(name: 'eyes', values: eyes);
    _validateHexArray(name: 'eyesColor', values: eyesColor, allowTransparent: true);

    _validateStringArray(name: 'glasses', values: glasses);
    _validateHexArray(name: 'glassesColor', values: glassesColor, allowTransparent: true);
    _checkRange(name: 'glassesProbability', value: glassesProbability, min: 0, max: 100);

    _validateStringArray(name: 'hair', values: hair);
    _validateHexArray(name: 'hairColor', values: hairColor, allowTransparent: true);

    _validateStringArray(name: 'hat', values: hat);
    _validateHexArray(name: 'hatColor', values: hatColor, allowTransparent: true);
    _checkRange(name: 'hatProbability', value: hatProbability, min: 0, max: 100);

    _validateStringArray(name: 'mouth', values: mouth);
    _validateHexArray(name: 'mouthColor', values: mouthColor, allowTransparent: true);
    _validateHexArray(name: 'skinColor', values: skinColor, allowTransparent: true);

    return _serializeMap({
      'accessories': accessories,
      'accessoriesColor': accessoriesColor,
      'accessoriesProbability': accessoriesProbability,
      'beard': beard,
      'beardProbability': beardProbability,
      'clothing': clothing,
      'clothingColor': clothingColor,
      'eyes': eyes,
      'eyesColor': eyesColor,
      'glasses': glasses,
      'glassesColor': glassesColor,
      'glassesProbability': glassesProbability,
      'hair': hair,
      'hairColor': hairColor,
      'hat': hat,
      'hatColor': hatColor,
      'hatProbability': hatProbability,
      'mouth': mouth,
      'mouthColor': mouthColor,
      'skinColor': skinColor,
    });
  }
}
