part of '../../dice_bear.dart';

class DiceBearBotttsOptions extends DiceBearCharacterStyleOptions {
  final List<String>? baseColor;
  final List<String>? face;
  final int? mouthProbability;
  final List<String>? sides;
  final int? sidesProbability;
  final List<String>? texture;
  final int? textureProbability;
  final List<String>? top;
  final int? topProbability;

  const DiceBearBotttsOptions({
    this.baseColor,
    super.eyes,
    this.face,
    super.mouth,
    this.mouthProbability,
    this.sides,
    this.sidesProbability,
    this.texture,
    this.textureProbability,
    this.top,
    this.topProbability,
  });

  @override
  Map<String, String> toQueryParameters() {
    _validateAllowedValues(
      name: 'baseColor',
      values: baseColor,
      allowed: const {
        '00897b',
        '00acc1',
        '039be5',
        '1e88e5',
        '3949ab',
        '43a047',
        '546e7a',
        '5e35b1',
        '6d4c41',
        '7cb342',
        '8e24aa',
        'c0ca33',
        'd81b60',
        'e53935',
        'f4511e',
        'fb8c00',
        'fdd835',
        'ffb300',
      },
    );
    _validateHexArray(name: 'baseColor', values: baseColor, allowTransparent: true);
    _validateStringArray(name: 'eyes', values: eyes);
    _validateAllowedValues(
      name: 'eyes',
      values: eyes,
      allowed: const {
        'bulging',
        'dizzy',
        'eva',
        'frame1',
        'frame2',
        'glow',
        'happy',
        'hearts',
        'robocop',
        'round',
        'roundFrame01',
        'roundFrame02',
        'sensor',
        'shade01',
      },
    );
    _validateStringArray(name: 'face', values: face);
    _validateAllowedValues(
      name: 'face',
      values: face,
      allowed: const {
        'round01',
        'round02',
        'square01',
        'square02',
        'square03',
        'square04',
      },
    );
    _validateStringArray(name: 'mouth', values: mouth);
    _validateAllowedValues(
      name: 'mouth',
      values: mouth,
      allowed: const {
        'bite',
        'diagram',
        'grill01',
        'grill02',
        'grill03',
        'smile01',
        'smile02',
        'square01',
        'square02',
      },
    );
    _checkProbability(name: 'mouthProbability', value: mouthProbability);
    _validateStringArray(name: 'sides', values: sides);
    _validateAllowedValues(
      name: 'sides',
      values: sides,
      allowed: const {
        'antenna01',
        'antenna02',
        'cables01',
        'cables02',
        'round',
        'square',
        'squareAssymetric',
      },
    );
    _checkProbability(name: 'sidesProbability', value: sidesProbability);
    _validateStringArray(name: 'texture', values: texture);
    _validateAllowedValues(
      name: 'texture',
      values: texture,
      allowed: const {
        'camo01',
        'camo02',
        'circuits',
        'dirty01',
        'dirty02',
        'dots',
        'grunge01',
        'grunge02',
      },
    );
    _checkProbability(name: 'textureProbability', value: textureProbability);
    _validateStringArray(name: 'top', values: top);
    _validateAllowedValues(
      name: 'top',
      values: top,
      allowed: const {
        'antenna',
        'antennaCrooked',
        'bulb01',
        'glowingBulb01',
        'glowingBulb02',
        'horns',
        'lights',
        'pyramid',
        'radar',
      },
    );
    _checkProbability(name: 'topProbability', value: topProbability);
    return _serializeMap({
      'baseColor': baseColor,
      'eyes': eyes,
      'face': face,
      'mouth': mouth,
      'mouthProbability': mouthProbability,
      'sides': sides,
      'sidesProbability': sidesProbability,
      'texture': texture,
      'textureProbability': textureProbability,
      'top': top,
      'topProbability': topProbability,
    });
  }
}
