part of '../../dice_bear.dart';

class DiceBearOpenPeepsOptions implements DiceBearStyleOptions {
  final List<String>? accessories;
  final int? accessoriesProbability;
  final List<String>? clothingColor;
  final List<String>? face;
  final List<String>? facialHair;
  final int? facialHairProbability;
  final List<String>? head;
  final List<String>? headContrastColor;
  final List<String>? mask;
  final int? maskProbability;
  final List<String>? skinColor;

  const DiceBearOpenPeepsOptions({
    this.accessories,
    this.accessoriesProbability,
    this.clothingColor,
    this.face,
    this.facialHair,
    this.facialHairProbability,
    this.head,
    this.headContrastColor,
    this.mask,
    this.maskProbability,
    this.skinColor,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateStringArray(name: 'accessories', values: accessories);
    _validateAllowedValues(
      name: 'accessories',
      values: accessories,
      allowed: const {
        'eyepatch',
        'glasses',
        'glasses2',
        'glasses3',
        'glasses4',
        'glasses5',
        'sunglasses',
        'sunglasses2',
      },
    );
    _checkProbability(name: 'accessoriesProbability', value: accessoriesProbability);
    _validateAllowedValues(
      name: 'clothingColor',
      values: clothingColor,
      allowed: const {'78e185', '8fa7df', '9ddadb', 'e279c7', 'e78276', 'fdea6b', 'ffcf77'},
    );
    _validateStringArray(name: 'face', values: face);
    _validateAllowedValues(
      name: 'face',
      values: face,
      allowed: const {
        'angryWithFang',
        'awe',
        'blank',
        'calm',
        'cheeky',
        'concerned',
        'concernedFear',
        'contempt',
        'cute',
        'cyclops',
        'driven',
        'eatingHappy',
        'explaining',
        'eyesClosed',
        'fear',
        'hectic',
        'lovingGrin1',
        'lovingGrin2',
        'monster',
        'old',
        'rage',
        'serious',
        'smile',
        'smileBig',
        'smileLOL',
        'smileTeethGap',
        'solemn',
        'suspicious',
        'tired',
        'veryAngry',
      },
    );
    _validateStringArray(name: 'facialHair', values: facialHair);
    _validateAllowedValues(
      name: 'facialHair',
      values: facialHair,
      allowed: const {
        'chin',
        'full',
        'full2',
        'full3',
        'full4',
        'goatee1',
        'goatee2',
        'moustache1',
        'moustache2',
        'moustache3',
        'moustache4',
        'moustache5',
        'moustache6',
        'moustache7',
        'moustache8',
        'moustache9',
      },
    );
    _checkProbability(name: 'facialHairProbability', value: facialHairProbability);
    _validateStringArray(name: 'head', values: head);
    _validateAllowedValues(
      name: 'head',
      values: head,
      allowed: const {
        'afro',
        'bangs',
        'bangs2',
        'bantuKnots',
        'bear',
        'bun',
        'bun2',
        'buns',
        'cornrows',
        'cornrows2',
        'dreads1',
        'dreads2',
        'flatTop',
        'flatTopLong',
        'grayBun',
        'grayMedium',
        'grayShort',
        'hatBeanie',
        'hatHip',
        'hijab',
        'long',
        'longAfro',
        'longBangs',
        'longCurly',
        'medium1',
        'medium2',
        'medium3',
        'mediumBangs',
        'mediumBangs2',
        'mediumBangs3',
        'mediumStraight',
        'mohawk',
        'mohawk2',
        'noHair1',
        'noHair2',
        'noHair3',
        'pomp',
        'shaved1',
        'shaved2',
        'shaved3',
        'short1',
        'short2',
        'short3',
        'short4',
        'short5',
        'turban',
        'twists',
        'twists2',
      },
    );
    _validateAllowedValues(
      name: 'headContrastColor',
      values: headContrastColor,
      allowed: const {
        '2c1b18',
        '4a312c',
        '724133',
        'a55728',
        'b58143',
        'c93305',
        'd6b370',
        'e8e1e1',
        'ecdcbf',
        'f59797',
      },
    );
    _validateStringArray(name: 'mask', values: mask);
    _validateAllowedValues(name: 'mask', values: mask, allowed: const {'medicalMask', 'respirator'});
    _checkProbability(name: 'maskProbability', value: maskProbability);
    _validateAllowedValues(
      name: 'skinColor',
      values: skinColor,
      allowed: const {'694d3d', 'ae5d29', 'd08b5b', 'edb98a', 'ffdbb4'},
    );
    return _serializeMap({
      'accessories': accessories,
      'accessoriesProbability': accessoriesProbability,
      'clothingColor': clothingColor,
      'face': face,
      'facialHair': facialHair,
      'facialHairProbability': facialHairProbability,
      'head': head,
      'headContrastColor': headContrastColor,
      'mask': mask,
      'maskProbability': maskProbability,
      'skinColor': skinColor,
    });
  }
}
